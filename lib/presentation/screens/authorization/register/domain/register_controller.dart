// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:FOODSTAR/internal/Utils/authentication_repository.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:get/get.dart';

class RegisterContoller extends GetxController {
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final userConfiredPassword = TextEditingController();
  final userName = TextEditingController();
  final userPhone = TextEditingController();
  final userBirhday = TextEditingController();

  var passwordIsHiding = false.obs;

  void changePasswordIsShow() {
    passwordIsHiding.value = !passwordIsHiding.value;
    update();
  }

  void register(
      {required String email,
      required String name,
      required String passworduser,
      required String confiredpasswordUser}) async {
    try {
      AuthenticationRepository.instance..createUser(
          email: email,
          name: name,
          passworduser: passworduser,
          confiredpasswordUser: confiredpasswordUser);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'email-already-in-use') {
        Get.snackbar('Ошибка', "Пошта вже прив'язана до профілю");
      }
    }
  }

  void navitateToLogin() {
    Get.toNamed(AppRoutes.login);
  }
}
