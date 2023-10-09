// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, prefer_function_declarations_over_variables, unnecessary_null_comparison, unused_local_variable, unused_catch_clause

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:FOODSTAR/domain/models/UserModel.dart';
import 'package:FOODSTAR/firebase_options.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth auth = FirebaseAuth.instance;
  late final Rxn<User?> firebaseUser;
  final currentUser = Rxn<UserModel>();
  final usersDb = FirebaseFirestore.instance.collection('Users');
  late Stream<User?> authStateChanges;
  late String _verificationId;

  void initAuth() async {
    authStateChanges = auth.authStateChanges();
    authStateChanges.listen((User? user) {
      getUserinfo(user);
    });
  }

  @override
  Future<void> onInit() async {
    firebaseUser = Rxn<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    inititalScreen(firebaseUser.value);
    update();
    super.onInit();
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.toNamed(AppRoutes.login);
      Get.snackbar('SMS код відправлений',
          'Повідомлення про відновлення пароля відправлено на $email',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Помилка', "$email пошта не привязана до аккаунта",
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(57, 255, 17, 0));
    }
  }

  Future<void> getUserinfo(User? user) async {
    try {
      if (user != null) {
        var querySnapshot =
            await usersDb.where('email', isEqualTo: user.email).get();

        if (querySnapshot.docs.isNotEmpty) {
          var userData = querySnapshot.docs.first.data();
          currentUser.value = UserModel.fromJson(userData);
          // print(currentUser);
        } else {
          print('User not found');
        }
        update();
      }
    } catch (e) {
      print('Error getting user info: $e');
    }
  }

  inititalScreen(User? user) {
    if (user == null) {
      Get.offAndToNamed(AppRoutes.login);
      print('null');
    } else if (user.emailVerified) {
      Get.toNamed(AppRoutes.main);
    } else {
      Get.offAndToNamed(AppRoutes.verification);
    }
  }

  Future<void> updateUser(UserModel account) async {
    await usersDb.doc(account.email).update(account.toJson());
    update();
  }

  Future<void> createUser({
    required String email,
    required String name,
    required String passworduser,
    required String confiredpasswordUser,
  }) async {
    if (passworduser == confiredpasswordUser) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: passworduser,
        );
        if (firebaseUser.value != null) {
          Get.toNamed(AppRoutes.verification);
        } else {
          Get.toNamed(AppRoutes.login);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> logIn({
    required String email,
    required String passworduser,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: passworduser,
      );
      getUserinfo(auth.currentUser);
      inititalScreen(firebaseUser.value);
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Помилка: ';
      switch (e.code) {
        case 'user-not-found':
          errorMessage += 'Користувач з таким email не знайдений.';
          break;
        case 'wrong-password':
          errorMessage += 'Невірний пароль.';
          break;
        case 'invalid-email':
          errorMessage += 'Невірний формат email.';
          break;
        default:
          errorMessage += 'Сталася помилка входу.';
      }
      Get.snackbar(
        'Помилка',
        errorMessage,
        colorText: Colors.white,
        backgroundColor: Colors.red[400],
      );
    } catch (e) {
      Get.snackbar('Помилка', 'Сталася помилка входу.',
          colorText: Colors.white);
    }
  }

  Future<void> signOutController() async {
    try {
      await auth.signOut();
      inititalScreen(auth.currentUser);
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await auth.currentUser?.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  Future<void> verificationPhone(String phoneNumber) async {
    try {
      PhoneVerificationCompleted verificationCompleted =
          (PhoneAuthCredential phoneAuthCredential) {
        print('Успешно');
      };

      PhoneVerificationFailed verificationFailed =
          (FirebaseAuthException authException) {
        print('Ошибка верификации: ${authException.message}');
      };

      PhoneCodeSent codeSent =
          (String verificationId, int? forceResendingToken) async {
        _verificationId = verificationId;
        print('Код отправлен. ID верификации: $verificationId');
      };

      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
          (String verificationId) {
        // Этот callback вызывается, если тайм-аут автоматического получения кода.
        print(
            'Тайм-аут автоматического получения кода. ID верификации: $verificationId');
      };
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      print('Произошла ошибка при верификации номера: $e');
    }
  }

  void verifyCode(String smsCode, String phoneNumber) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: smsCode);

      // Попытка аутентификации
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // Проверка успешности аутентификации
      if (userCredential.user != null) {
        changePhomeNumberUser(phoneNumber);
        Get.snackbar('Успіх', 'Код підтверджено!',
            colorText: Colors.white,
            backgroundColor: const Color.fromARGB(60, 0, 255, 0));
        Get.toNamed(AppRoutes.main);
      } else {
        // Ошибка аутентификации
        Get.snackbar('Помилка', 'Не вірний SMS-код',
            colorText: Colors.white,
            backgroundColor: const Color.fromARGB(60, 255, 0, 0));
      }
    } catch (e) {
      // Ошибка в процессе аутентификации
      print('Помилка під час аутентифікації:: $e');
      Get.snackbar('Помилка', 'Виникла помилка під час аутентифікації',
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(60, 255, 0, 0));
    }
  }

  Future<void> signWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.iosClientId);

    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _gAuthentication = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _gAuthentication.idToken,
            accessToken: _gAuthentication.accessToken);
        await auth.signInWithCredential(_credential);

        var querySnapshot =
            await usersDb.where('email', isEqualTo: account.email).get();

        if (querySnapshot.docs.isEmpty) {
          await saveUserWithGoogleSign(account);
        }

        getUserinfo(auth.currentUser);
        inititalScreen(firebaseUser.value);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signWithApple() async {
    try {
      AuthorizationResult authorizationResult =
          await TheAppleSignIn.performRequests([
        const AppleIdRequest(requestedScopes: [
          Scope.email,
          Scope.fullName,
        ])
      ]);

      switch (authorizationResult.status) {
        case AuthorizationStatus.authorized:
          final AppleIdCredential? appleIdCredential =
              authorizationResult.credential;
          if (appleIdCredential == null) {
            print('Error: Apple ID credential is null');
            return;
          }

          final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
          final OAuthCredential oAuthCredential = oAuthProvider.credential(
            idToken: String.fromCharCodes(appleIdCredential.identityToken!),
            accessToken:
                String.fromCharCodes(appleIdCredential.authorizationCode!),
          );

          await auth.signInWithCredential(oAuthCredential);
          print('Successfully authorized with Apple');
          break;

        case AuthorizationStatus.cancelled:
          print('Apple sign-in cancelled');
          break;

        default:
          print('Apple sign-in failed with an error');
          break;
      }
    } catch (e) {
      print('Error during Apple sign-in: $e');
    }
  }

  Future<void> changePhomeNumberUser(String phomeNumber) async {
    await usersDb.doc(currentUser.value?.email).set({
      'email': currentUser.value?.email,
      'name': currentUser.value?.name,
      'phone': phomeNumber,
      'dateOfbirth': currentUser.value?.dateOfbirth,
    });
    update();
    getUserinfo(auth.currentUser);
  }

  Future<void> saveUserWithGoogleSign(GoogleSignInAccount account) async {
    await usersDb.doc(account.email).set({
      'email': account.email,
      'name': account.displayName,
      'phone': '',
      'dateOfbirth': '',
    });
  }
}
