import 'package:flutter/material.dart';
import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ImageCart extends StatelessWidget {
  const ImageCart({super.key, this.index});

  final index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (CartController cartController) {
      return Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SizedBox(
          height: 120,
          width: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              cartController.cart.value.items[index].dish.dish_image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    });
  }
}
