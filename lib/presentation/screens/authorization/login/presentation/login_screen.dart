import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';
import 'package:FOODSTAR/presentation/screens/authorization/login/domain/login_controller.dart';
import 'package:FOODSTAR/presentation/screens/authorization/login/widgets/textField_auhorization.dart';
import 'package:FOODSTAR/presentation/screens/authorization/login/widgets/textField_auhorizationPassword.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:get/get.dart';
import '../../../../../components/my_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (LoginController controller) {
      return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill,
            )),
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    FadeInDown(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 500),
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 60),
//LoginEntry
                    FadeInRight(
                      child: TextFieldAuhorization(
                          controller: controller.email,
                          icon: Image.asset(
                            'assets/images/mail_icon.png',
                            scale: 20,
                            color: Colors.white,
                          ),
                          labelText: WordLocalizations.Email.tr),
                    ),
//PasswordEntry
                    FadeInLeft(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 500),
                      child: TextFieldAuhorizationPassword(
                        textcontroller: controller.password,
                        labelText: WordLocalizations.Password.tr,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.resetPassword),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 20, top: 0, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FadeInRight(
                              delay: const Duration(milliseconds: 500),
                              duration: const Duration(milliseconds: 500),
                              child: Text(
                                WordLocalizations.ForgotPassword.tr,
                                style: const TextStyle(
                                    color: Color.fromRGBO(200, 200, 200, 1),
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 500),
                      child: MyButton(
                        onTap: () {
                          controller.logIn(
                              email: controller.email.text.trim(),
                              password: controller.password.text.trim());
                        },
                        buttonText: WordLocalizations.SignIn.tr,
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: Text(
                              WordLocalizations.SignWith.tr,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(200, 200, 200, 100)),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                    FadeInUp(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => controller.signWithG(),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Image.asset(
                                "assets/images/google.png",
                                height: 50,
                              ),
                            ),
                          ),
                          const SizedBox(width: 50),
                          GestureDetector(
                            onTap: () async {
                              controller.signWithApple();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Image.asset(
                                "assets/images/apple.png",
                                height: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeInUp(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            WordLocalizations.DontHaveAccount.tr,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.registerUser),
                            child: Text(WordLocalizations.CreateAccount.tr,
                                style: const TextStyle(
                                    color: Color.fromRGBO(255, 193, 34, 1),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
