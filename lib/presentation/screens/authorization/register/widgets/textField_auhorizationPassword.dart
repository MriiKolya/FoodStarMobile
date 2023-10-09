import 'package:flutter/material.dart';
import 'package:FOODSTAR/presentation/screens/authorization/register/domain/register_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TextFieldAuhorizationPasswordRegister extends StatelessWidget {
  final TextEditingController textcontroller;
  final String labelText;

  TextFieldAuhorizationPasswordRegister({
    super.key,
    required this.textcontroller,
    required this.labelText,
  });

  var controller = Get.find<RegisterContoller>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
          obscureText: controller.passwordIsHiding.value,
          controller: textcontroller,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            prefixIcon: Image.asset("assets/images/password.png", scale: 2.5),
            suffixIcon: IconButton(
                icon: controller.passwordIsHiding.value
                    ? const Icon(Icons.visibility, color: Colors.white)
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.white,
                      ),
                onPressed: () {
                  controller.changePasswordIsShow();
                }),
            fillColor: Theme.of(context).primaryColor,
            enabledBorder: OutlineInputBorder(
              // Оформление границ
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                  color: Colors.white, width: 1), // Цвет границы
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromRGBO(255, 193, 34, 100)), // Цвет границы
            ),
          )),
    );
  }
}
