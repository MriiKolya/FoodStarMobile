import 'package:FOODSTAR/presentation/screens/profile_User/domain/profile_user_controller.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/presentation/buttonEdit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileUserController>(
        builder: (ProfileUserController controller) {
      return ButtonEdit(
        function: () {
          Get.defaultDialog(
            title: '',
            middleText: 'Впевнені, що ви хочете вийти ?',
            middleTextStyle: const TextStyle(
              fontSize: 24,
            ),
            confirm: TextButton(
                style: TextButton.styleFrom(
                  fixedSize: const Size(150, 50),
                ),
                onPressed: () {
                  controller.signOut();
                },
                child: const Text(
                  'Вийти',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                )),
            cancel: TextButton(
                style: TextButton.styleFrom(
                  fixedSize: const Size(150, 50),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Скасувати',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          );
        },
        buttonText: 'Вийти',
        buttonColor: Colors.red,
      );
    });
  }
}
