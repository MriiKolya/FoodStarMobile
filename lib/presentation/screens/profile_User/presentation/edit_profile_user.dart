import 'package:FOODSTAR/domain/models/UserModel.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/domain/profile_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileUserController>(
        builder: (ProfileUserController controller) {
      return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Visibility(
          visible: controller.enableEditProfile.value,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: () {
                controller.editProfile();
                controller.readingUserInformation();
              },
              child: const Text(
                'Скасувати',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            GestureDetector(
              onTap: () async {
                controller.editProfile();
                final userData = UserModel(
                  dateOfbirth: controller.dateOfbirth.value.text.trim(),
                  name: controller.name.value.text.trim(),
                  email: controller.email.value.text.trim(),
                  phone: controller.phone.value.text.trim(),
                );
                await controller.updateUser(userData);
              },
              child: const Text(
                'Готово',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          ]),
        ),
        Visibility(
          visible: !controller.enableEditProfile.value,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            GestureDetector(
              onTap: () {
                controller.editProfile();
              },
              child: const Text(
                'Редагувати',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          ]),
        ),
      ]);
    });
  }
}
