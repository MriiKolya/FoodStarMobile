// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonEdit extends StatelessWidget {
  final void Function() function;
  final String buttonText;
  final Color buttonColor;

  const ButtonEdit(
      {super.key,
      required this.function,
      required this.buttonText,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 400),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: function,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                buttonText,
                style: TextStyle(fontSize: 18, color: buttonColor),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: buttonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
