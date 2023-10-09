import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
    required this.imageLogo,
    required this.title,
    this.colorIcon,
    required this.borderColor,
    this.fontWeight,
  });

  final String imageLogo;
  final String title;
  final Color? colorIcon;
  final Color borderColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: FittedBox(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black54,
              border: Border.all(color: borderColor, width: 1)),
          width: 160,
          height: 100,
          child: Center(
            child: ListTile(
              title: SizedBox(
                height: 40,
                width: 50,
                child: Image.asset(
                  imageLogo,
                  color: colorIcon,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: fontWeight),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
