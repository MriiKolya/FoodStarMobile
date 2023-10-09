// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';
import 'package:FOODSTAR/domain/models/DishModel.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainInfoDish extends StatelessWidget {
  MainInfoDish({super.key, required this.dish});

  final cartController = Get.put(CartController());
  final DishModel dish;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: const TextStyle(fontSize: 30), children: [
              TextSpan(text: ' ${WordLocalizations.by.tr} '),
              TextSpan(
                  text: dish.author,
                  style: TextStyle(color: AppColors.additionalcolor)),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                dish.author_image,
              ),
              radius: 50),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: Container(color: Colors.white30, height: 1),
        ),
        FadeInDown(
          duration: const Duration(milliseconds: 300),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                dish.ingredients,
                style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Center(
            child: RichText(
              text: TextSpan(
                  text: dish.price.toString(),
                  style: const TextStyle(fontSize: 36),
                  children: const [TextSpan(text: ' грн')]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: RichText(
              text: TextSpan(
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),
            children: [
              TextSpan(text: dish.weight),
              const TextSpan(text: ' г | '),
              TextSpan(text: dish.calories),
              const TextSpan(text: ' калл '),
            ],
          )),
        ),
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                fixedSize: const Size(200, 55),
                backgroundColor: AppColors.additionalcolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: TextButton(
              onPressed: () {
                cartController.addDishToCart(dish);
                Get.snackbar('', '',
                    titleText: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: ' ${dish.title}',
                              style:
                                  TextStyle(color: AppColors.additionalcolor)),
                        ])),
                    messageText: const Text(
                      'було добавлено в корзину',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color.fromRGBO(17, 17, 17, 100),
                    maxWidth: 260,
                    snackPosition: SnackPosition.TOP);
              },
              child: const Text(
                'В КОРЗИНУ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Text(
            dish.add_information,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
        ),
        Container(height: 300, color: AppColors.mainColor)
      ],
    );
  }
}
