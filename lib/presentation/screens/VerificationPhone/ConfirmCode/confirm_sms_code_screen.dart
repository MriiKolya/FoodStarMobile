// ignore_for_file: deprecated_member_use, avoid_print, prefer_interpolation_to_compose_strings

import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/components/my_button.dart';
import 'package:FOODSTAR/presentation/screens/VerificationPhone/domain/bottomsheet_phonecode_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhoneCodeController>(
        builder: (PhoneCodeController controller) {
      return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill,
          )),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: controller.codeKey,
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
                            'Будь ласка, введіть отриманий код SMS-повідомлення.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 150),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: SizedBox(
                              width: 200,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                validator: (phone) {
                                  if (controller.maskCodeFormatter
                                          .getUnmaskedText()
                                          .length !=
                                      6) {
                                    return 'Не вірний код';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                controller: controller.codeController,
                                cursorColor: AppColors.additionalcolor,
                                inputFormatters: [controller.maskCodeFormatter],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                                decoration: InputDecoration(
                                  errorBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(148, 255, 0, 0),
                                          width: 1)),
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              149, 158, 158, 158),
                                          width: 1)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.additionalcolor,
                                          width: 1)),
                                  focusColor: AppColors.additionalcolor,
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
                              if (controller.codeKey.currentState != null &&
                                  controller.codeKey.currentState!.validate()) {
                                controller.confirmCode();
                              }
                            },
                            buttonText: 'Підтвердити'),
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
