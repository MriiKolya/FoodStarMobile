import 'package:flutter/material.dart';
import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/presentation/screens/Cart/presentation/cart_IsNotEmpty.dart';
import 'package:FOODSTAR/presentation/screens/Cart/presentation/widgets/cart_empty.dart';

import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';

import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (CartController cartController) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.mainColor,
              body: cartController.cart.value.items.isNotEmpty
                  ? CartNotEmpty()
                  : const CartIsEmpty()));
    });
  }
}
