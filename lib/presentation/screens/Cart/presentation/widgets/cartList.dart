import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';
import 'package:FOODSTAR/presentation/screens/Cart/presentation/widgets/image.dart';
import 'package:FOODSTAR/presentation/screens/Cart/presentation/widgets/price_and_count.dart';
import 'package:FOODSTAR/presentation/screens/Cart/presentation/widgets/subtitle.dart';
import 'package:FOODSTAR/presentation/screens/Cart/presentation/widgets/title.dart';
import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (CartController cartController) {
      return Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: cartController.cart.value.items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.detailDish,
                        arguments: cartController.cart.value.items[index].dish);
                  },
                  child: Slidable(
                    key: UniqueKey(),
                    startActionPane: ActionPane(
                      extentRatio: 0.3,
                      dismissible: DismissiblePane(onDismissed: () {
                        cartController.deleteDish(
                            cartController.cart.value.items[index].dish);
                      }),
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            // borderRadius: BorderRadius.circular(50),
                            spacing: 10,
                            label: WordLocalizations.Delete.tr,
                            icon: Icons.delete_outlined,
                            backgroundColor:
                                const Color.fromRGBO(221, 0, 1, 100),
                            onPressed: (context) {
                              cartController.deleteDish(
                                  cartController.cart.value.items[index].dish);
                            })
                      ],
                    ),
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: cartController
                          .cart.value.items[index].dish.dish_image,
                      child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30, left: 10),
                            child: Row(children: [
                              ImageCart(index: index),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 200,
                                    child: TitleDish(index: index),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    height: 20,
                                    child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: SubTitleDish(index: index)),
                                  ),
                                  SizedBox(
                                      height: 40,
                                      width: 250,
                                      child: PriceAndCountDish(index: index))
                                ],
                              ),
                            ]),
                          )),
                    ),
                  ),
                );
              }),
        ),
        Container(
          height: 100,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(54, 54, 54, 100),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Countup(
                        duration: const Duration(milliseconds: 600),
                        begin: cartController.getCurrentTotalCost,
                        end: cartController.getCurrentTotalCost,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RichText(
                          text: const TextSpan(
                              text: ' грн ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.checkout);
                    },
                    style: TextButton.styleFrom(
                        fixedSize: const Size(150, 50),
                        backgroundColor: const Color.fromRGBO(221, 0, 1, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      'Оплатити'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]);
    });
  }
}
