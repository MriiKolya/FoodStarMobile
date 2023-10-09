// ignore_for_file: deprecated_member_use, avoid_print, prefer_interpolation_to_compose_strings

import 'package:animate_do/animate_do.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/components/my_button.dart';

import 'package:FOODSTAR/presentation/screens/authorization/reset_password/domain/change_password_controller.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
        builder: (ChangePasswordController controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.emailKey,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill,
              )),
              child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                      const SizedBox(height: 200),
                      FadeInDown(
                        delay: const Duration(milliseconds: 150),
                        duration: const Duration(milliseconds: 300),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'Будь ласка, введіть свою електронну адресу, і ми надішлемо вам код підтвердження.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 150),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Будь ласка, введіть електронну адресу';
                              } else if (!EmailValidator.validate(
                                  value.trim())) {
                                return 'Введіть коректну електронну адресу';
                              }
                              return null; // Все в порядке
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailController,
                            cursorColor: AppColors.additionalcolor,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                            decoration: InputDecoration(
                              errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(148, 255, 0, 0),
                                      width: 1)),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(149, 158, 158, 158),
                                      width: 1)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.additionalcolor,
                                      width: 1)),
                              focusColor: AppColors.additionalcolor,
                              label: const Text(
                                'Eлектронну аддреса',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 150),
                      FadeInUp(
                        delay: const Duration(milliseconds: 300),
                        duration: const Duration(milliseconds: 250),
                        child: MyButton(
                            onTap: () {
                              if (controller.emailKey.currentState != null &&
                                  controller.emailKey.currentState!
                                      .validate()) {
                                controller.resetPassword();
                              }
                            },
                            buttonText: 'Надіслати код'),
                      )
                    ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
