import 'package:FOODSTAR/components/cart_widget/cart_widgets.dart';
import 'package:FOODSTAR/presentation/screens/main/domain/navitation_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(builder: (NavController navController) {
      return GestureDetector(
        onTap: () {
          navController.setSelectedIndex(1);
          Get.back();
        },
        child: FadeInRight(
          duration: const Duration(milliseconds: 500),
          delay: const Duration(milliseconds: 300),
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black54,
                  child: CartWidget()),
            ),
          ),
        ),
      );
    });
  }
}
