// ignore_for_file: deprecated_member_use, avoid_print, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables

import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/components/my_button.dart';
import 'package:FOODSTAR/presentation/screens/VerificationPhone/EntryPhone/change_phone_bottomsheets.dart';
import 'package:FOODSTAR/presentation/screens/VerificationPhone/domain/bottomsheet_phonecode_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChangePhoneScreen extends StatelessWidget {
  ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhoneCodeController>(
        builder: (PhoneCodeController controller) {
      return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Form(
          key: controller.phoneKey,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )),
            child: SafeArea(
              child: SingleChildScrollView(
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
                            'Будь ласка, введіть свій номер телефону, і ми надішлемо вам код підтвердження.',
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
                            validator: (phone) {
                              if (controller.maskPhoneFormatter
                                      .getUnmaskedText()
                                      .length !=
                                  9) {
                                return 'Будь ласка, введіть дійсний номер мобільного телефону';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            controller: controller.phoneNumberController,
                            cursorColor: AppColors.additionalcolor,
                            inputFormatters: [controller.maskPhoneFormatter],
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
                                'Номер телефона',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              prefix: GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(
                                    const BottomSheetsPhone(),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    controller.selectCountry.value.phoneCode,
                                    style: TextStyle(
                                        color: AppColors.additionalcolor,
                                        fontSize: 24),
                                  ),
                                ),
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
                              if (controller.phoneKey.currentState != null &&
                                  controller.phoneKey.currentState!
                                      .validate()) {
                                controller.phoneVerification();
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
