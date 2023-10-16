// ignore_for_file: avoid_print

import 'package:FOODSTAR/presentation/screens/profile_User/domain/profile_user_controller.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/presentation/buttonEdit.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';

class DeleteUserButton extends StatelessWidget {
  const DeleteUserButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileUserController>(
        builder: (ProfileUserController controller) {
      return ButtonEdit(
        function: () {
          print("Deleted");
        },
        buttonText: 'Видалити Аккаунт',
        buttonColor: Colors.red,
      );
    });
  }
}
