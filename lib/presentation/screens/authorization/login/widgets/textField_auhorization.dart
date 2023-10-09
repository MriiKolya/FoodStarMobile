import 'package:flutter/material.dart';

class TextFieldAuhorization extends StatelessWidget {
  final Widget icon;
  final TextEditingController controller;
  final String labelText;

  const TextFieldAuhorization(
      {super.key,
      required this.icon,
      required this.controller,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          prefixIcon: icon,
          fillColor: Theme.of(context).primaryColor,
          enabledBorder: OutlineInputBorder(
            // Оформление границ
            borderRadius: BorderRadius.circular(20.0),
            borderSide:
                const BorderSide(color: Colors.white, width: 1), // Цвет границы
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
                width: 2,
                color: Color.fromRGBO(255, 193, 34, 100)), // Цвет границы
          ),
        ),
      ),
    );
  }
}
