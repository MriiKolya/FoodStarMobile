import 'package:flutter/material.dart';
import 'package:FOODSTAR/components/my_button.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';
import 'package:FOODSTAR/presentation/screens/authorization/register/widgets/textField_auhorization.dart';
import 'package:FOODSTAR/presentation/screens/authorization/register/widgets/textField_auhorizationPassword.dart';
import 'package:get/get.dart';

import '../domain/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterContoller>(
        builder: (RegisterContoller controller) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill,
          )),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage("assets/images/logo.png"),
                    ),
                    //LoginEntry
                    const SizedBox(height: 30),
//MailEntry
                    TextFieldAuhorizationRegister(
                        keyboadrdType: TextInputType.name,
                        icon: Image.asset(
                          'assets/images/user_icon.png',
                          scale: 2.8,
                          color: Colors.white,
                        ),
                        controller: controller.userName,
                        labelText: WordLocalizations.Name.tr),
//MailEntry
                    TextFieldAuhorizationRegister(
                        keyboadrdType: TextInputType.emailAddress,
                        icon: Image.asset(
                          'assets/images/mail_icon.png',
                          scale: 22,
                          color: Colors.white,
                        ),
                        controller: controller.userEmail,
                        labelText: WordLocalizations.Email.tr),

//PasswordEntry
                    TextFieldAuhorizationPasswordRegister(
                        textcontroller: controller.userPassword,
                        labelText: WordLocalizations.Password.tr),

//PasswordEntry
                    TextFieldAuhorizationPasswordRegister(
                        textcontroller: controller.userConfiredPassword,
                        labelText: WordLocalizations.ConfirmPassword.tr),
                    MyButton(
                      onTap: () {
                        controller.register(
                          email: controller.userEmail.text.trim(),
                          name: controller.userName.text.trim(),
                          passworduser: controller.userPassword.text.trim(),
                          confiredpasswordUser:
                              controller.userConfiredPassword.text.trim(),
                        );
                      },
                      buttonText: WordLocalizations.SignUp.tr,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          WordLocalizations.HaveAccount.tr,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => controller.navitateToLogin(),
                          child: Text(WordLocalizations.LogInNow.tr,
                              style: const TextStyle(
                                  color: Color.fromRGBO(255, 193, 34, 1),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                        )
                      ],
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
