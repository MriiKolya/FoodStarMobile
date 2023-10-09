import 'package:flutter/material.dart';
import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';
import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class TitleDish extends StatelessWidget {
  const TitleDish({super.key, this.index});

  final index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (CartController cartController) {
      return RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: cartController.cart.value.items[index].dish.title,
                style: const TextStyle(color: Colors.white)),
            TextSpan(text: ' ${WordLocalizations.by.tr} '),
            TextSpan(
                text: cartController.cart.value.items[index].dish.author,
                style: TextStyle(color: AppColors.additionalcolor)),
          ],
        ),
      );
    });
  }
}
