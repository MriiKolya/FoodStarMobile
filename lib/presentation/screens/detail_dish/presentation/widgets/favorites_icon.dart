// ignore_for_file: must_be_immutable

import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';
import 'package:FOODSTAR/domain/models/DishModel.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FavotiresIcon extends StatelessWidget {
  const FavotiresIcon({
    super.key,
    required this.dish,
  });

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (CartController navController) {
      return GestureDetector(
        onTap: () {
          dish.isFavorite = !dish.isFavorite;
          if (dish.isFavorite == true) {
            Get.snackbar('', '',
            maxWidth: 300,
                titleText: Text(
                  dish.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.additionalcolor),
                ),
                backgroundColor: Colors.black54,
                messageText: const Text(
                  'Добавленно в улюблене',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                colorText: Colors.white);
          }
          navController.update();
        },
        child: FadeInRight(
          duration: const Duration(milliseconds: 500),
          delay: const Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
                height: 35,
                width: 35,
                child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black54,
                    // child:
                    //     RiveAnimation.asset('assets/rive_assets/like_icon_riv'),
                    child: Icon(Icons.favorite,
                        size: 20,
                        color: !dish.isFavorite
                            ? Colors.white38
                            : AppColors.additionalcolor))),
          ),
        ),
      );
    });
  }
}
