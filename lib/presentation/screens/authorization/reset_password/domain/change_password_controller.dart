import 'package:flutter/material.dart';
import 'package:FOODSTAR/internal/Utils/authentication_repository.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final emailKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void resetPassword() {
    AuthenticationRepository.instance
        .resetPassword(emailController.text.trim());
  }
}
