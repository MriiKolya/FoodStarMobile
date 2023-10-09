import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldEdit extends StatelessWidget {
  const TextFieldEdit(
      {super.key,
      required this.myController,
      required this.labelText,
      required this.isEnabled,
      required this.typeKeyboard});

  final TextEditingController myController;
  final String labelText;
  final bool isEnabled;
  final TextInputType typeKeyboard;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
      enabled: isEnabled,
      keyboardType: typeKeyboard,
      cursorColor: AppColors.additionalcolor,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(47, 255, 255, 255))),
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.additionalcolor, width: 0.3)),
        labelText: labelText,
        labelStyle: const TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal),
      ),
    );
  }
}
