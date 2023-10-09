// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PriceAndCountDish extends StatelessWidget {
  const PriceAndCountDish({super.key, required this.index});

  final index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (CartController cartController) {
      return Row(
        children: [
          FittedBox(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                children: [
                  TextSpan(
                      text: cartController.cart.value.items[index].dish.price
                          .toString()),
                  const TextSpan(text: ' грн ', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: GestureDetector(
              onTap: () {
                cartController.removeDishToCart(
                    cartController.cart.value.items[index].dish);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(156, 156, 156, 100),
                        borderRadius: BorderRadius.circular(10)),
                    // child: const Icon(Icons.remove,size: 25,)
                    child: const Center(
                        child: Text(
                      '-',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: FittedBox(
                child: AnimatedFlipCounter(
                  value: cartController.cart.value.items[index].quantity,
                  textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: GestureDetector(
              onTap: () {
                cartController
                    .addDishToCart(cartController.cart.value.items[index].dish);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(156, 156, 156, 100),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    '+',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
