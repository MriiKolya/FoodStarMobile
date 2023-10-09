import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';

import 'package:FOODSTAR/presentation/screens/main/domain/navitation_controller.dart';
import 'package:get/get.dart';

class DeliverySuggestionsDiscount extends StatelessWidget {
  const DeliverySuggestionsDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(builder: (NavController controller) {
      return GestureDetector(
        onTap: () {
          controller.setSelectedIndex(2);
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
                  bottom: 0, top: 30, left: 20, right: 20),
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
                              text: WordLocalizations.Order.tr,
                              style: const TextStyle(
                                  color: Color.fromRGBO(254, 193, 33, 1))),
                          const TextSpan(text: '\n'),
                          const TextSpan(text: 'FSDelivery'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/box_delivery.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
