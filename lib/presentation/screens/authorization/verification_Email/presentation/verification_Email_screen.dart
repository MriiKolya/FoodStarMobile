// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:FOODSTAR/components/my_button.dart';
import 'package:FOODSTAR/presentation/screens/authorization/verification_Email/domain/verification_Email_controller.dart';
import 'package:get/get.dart';

class VerificationEmailScreen extends StatelessWidget {
  const VerificationEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<VerificationEmailController>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        )),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
                    child: Image.asset(
                      'assets/images/email_icon.png',
                      scale: 2.5,
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    "На вашу електронну адресу надіслано листа з посиланням. Будь ласка, перейдіть за ним для підтвердження адреси.",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'arial',
                    ),
                  ),
                ),
                MyButton(
                    onTap: () {
                      controller.setTimerForAcceptEmail();
                    },
                    buttonText: "Продовжити"),
                GestureDetector(
                  onTap: () {
                    controller.sendVerificationEmail();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          size: 30,
                          color: Color.fromRGBO(254, 193, 35, 1),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Відправити повторно",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(254, 193, 35, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.back(),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                          color: Color.fromRGBO(254, 193, 35, 1),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Повернутись назад",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(254, 193, 35, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

