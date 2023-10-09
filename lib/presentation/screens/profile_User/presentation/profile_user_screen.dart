// ignore_for_file: avoid_print

import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/domain/profile_user_controller.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/presentation/ButtonFunction/button_change_phone.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/presentation/ButtonFunction/button_changepassword.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/presentation/ButtonFunction/button_delete_user.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/presentation/ButtonFunction/button_exit.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/presentation/edit_profile_user.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/presentation/text_field_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileUserController());
    return GetBuilder<ProfileUserController>(
        builder: (ProfileUserController controller) {
      return Scaffold(
          backgroundColor: AppColors.mainColor,
          body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const EditProfile(),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 25),
                      child: Text(
                        'Мій Профіль',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    TextFieldEdit(
                      myController: controller.email.value,
                      typeKeyboard: TextInputType.emailAddress,
                      labelText: 'Електронна пошта',
                      isEnabled: false,
                    ),
                    TextFieldEdit(
                      myController: controller.name.value,
                      labelText: "Ім'я",
                      typeKeyboard: TextInputType.text,
                      isEnabled: controller.enableEditProfile.value,
                    ),
                    TextFieldEdit(
                      myController: controller.phone.value,
                      labelText: 'Телефон',
                      isEnabled: false,
                      typeKeyboard: TextInputType.phone,
                    ),
                    TextFieldEdit(
                      myController: controller.dateOfbirth.value,
                      labelText: 'Дата народження (не обов`язково)',
                      isEnabled: controller.enableEditProfile.value,
                      typeKeyboard: TextInputType.datetime,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const ChangePasswordButton(),
                    const ChangePhoneButton(),
                    const ExitButton(),
                    const DeleteUserButton()
                  ]),
            )),
          ));
    });
  }
}
