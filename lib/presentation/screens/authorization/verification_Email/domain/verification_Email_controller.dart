// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:FOODSTAR/internal/Utils/authentication_repository.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:get/get.dart';

class VerificationEmailController extends GetxController {
  // var user = FirebaseAuth.instance.currentUser;
  late Timer setTimer;
  @override
  void onInit() {
    sendVerificationEmail();
    super.onInit();
  }

  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      print("sendLink");
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  void setTimerForAcceptEmail() {
    setTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      if (AuthenticationRepository.instance.firebaseUser.value!.emailVerified) {
        timer.cancel();
        print("emailAccept");
        Get.snackbar('Вітаю', 'Ваш Профіль створений');
        AuthenticationRepository.instance.inititalScreen(
            AuthenticationRepository.instance.firebaseUser.value);
      } else {
        print("nothaveAccept");
      }
    });
  }

  void back() {
    Get.toNamed(AppRoutes.login);
  }
}
