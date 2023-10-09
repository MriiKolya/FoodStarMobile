// ignore_for_file: avoid_print

import 'package:FOODSTAR/presentation/screens/profile_User/domain/profile_user_controller.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/presentation/buttonEdit.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChangePhoneButton extends StatelessWidget {
  const ChangePhoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileUserController>(
        builder: (ProfileUserController controller) {
      return ButtonEdit(
        function: () {
          Get.toNamed(AppRoutes.changePhone);
        },
        buttonText: 'Змінити телефон',
        buttonColor: Colors.white,
      );
    });
  }
}
