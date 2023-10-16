// ignore_for_file: file_names

import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';
import 'package:FOODSTAR/presentation/screens/main/domain/navitation_controller.dart';
import 'package:get/get.dart';

class SupportUkraineDiscount extends StatelessWidget {
  const SupportUkraineDiscount({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(builder: (NavController controller) {
      return GestureDetector(
        onTap: () {
          controller.setSelectedIndex(4);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.additionalcolor, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 30, top: 30, left: 20, right: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: WordLocalizations.Support.tr,
                              style: const TextStyle(
                                  color: Color.fromRGBO(254, 193, 33, 1))),
                          const TextSpan(text: '\n'),
                          TextSpan(text: WordLocalizations.Donation.tr),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Image(
                            image: AssetImage(
                                'assets/images/ukraine_support.png')),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            WordLocalizations.HelpChildren.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
