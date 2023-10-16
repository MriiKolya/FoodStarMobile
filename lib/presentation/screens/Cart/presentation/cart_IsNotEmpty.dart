// ignore_for_file: file_names

import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';
import 'package:FOODSTAR/presentation/screens/Cart/presentation/widgets/cartList.dart';
import 'package:FOODSTAR/presentation/screens/main/domain/navitation_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartNotEmpty extends StatelessWidget {
  CartNotEmpty({super.key});

  final navController = Get.put(NavController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (CartController cartController) {
      return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                stretch: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                backgroundColor: AppColors.mainColor,
                title: FadeInDown(
                  duration: const Duration(milliseconds: 300),
                  delay: const Duration(milliseconds: 300),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      WordLocalizations.Cart.tr,
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      navController.setSelectedIndex(2);
                    },
                    child: FadeInLeft(
                      duration: const Duration(milliseconds: 300),
                      delay: const Duration(milliseconds: 300),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white10,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                          title: '',
                          buttonColor: AppColors.additionalcolor,
                          cancelTextColor: Colors.black,
                          confirmTextColor: Colors.black,
                          content: const Center(
                            child: Text(
                              'Очистити корзину ?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          backgroundColor: Colors.white38,
                          onConfirm: () {
                            Get.back();
                            cartController.clearCart();
                          },
                          textCancel: "Ні",
                          textConfirm: 'Так');
                    },
                    child: FadeInLeft(
                      duration: const Duration(milliseconds: 300),
                      delay: const Duration(milliseconds: 300),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white10,
                              child: Icon(
                                Icons.delete_outline_sharp,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FadeInLeft(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 100),
                child: const CartList()),
          ));
    });
  }
}
