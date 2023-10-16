// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SubTitleDish extends StatelessWidget {
  const SubTitleDish({super.key, required this.index});

  final index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (CartController cartController) {
      return RichText(
          text: TextSpan(
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
        children: [
          TextSpan(
              text: cartController.cart.value.items[index].dish.weight,
              style: const TextStyle()),
          const TextSpan(text: ' г | '),
          TextSpan(
            text: cartController.cart.value.items[index].dish.calories,
          ),
          const TextSpan(text: ' калл'),
        ],
      ));
    });
  }
}
