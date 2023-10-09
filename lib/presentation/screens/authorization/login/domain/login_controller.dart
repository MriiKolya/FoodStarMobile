// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FOODSTAR/internal/Utils/authentication_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  var passwordIsHiding = true.obs;

  void changePasswordIsShow() {
    passwordIsHiding.value = !passwordIsHiding.value;
    update();
  }

  void logIn({required String email, required String password}) {
    AuthenticationRepository.instance
        .logIn(email: email, passworduser: password);
  }

  void signWithG() async {
    AuthenticationRepository.instance.signWithGoogle();
    await AuthenticationRepository.instance
        .getUserinfo(AuthenticationRepository.instance.auth.currentUser);
    update();
  }

  signWithApple() async {
    AuthenticationRepository.instance.signWithApple();
  }
}
