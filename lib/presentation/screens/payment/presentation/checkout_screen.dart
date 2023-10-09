import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';
import 'package:FOODSTAR/presentation/screens/payment/domain/location_controller.dart';
import 'package:FOODSTAR/presentation/screens/payment/presentation/bottomshield_take_location.dart';
import 'package:FOODSTAR/presentation/screens/payment/presentation/payment_method/domain/payment_controller.dart';
import 'package:FOODSTAR/presentation/screens/payment/presentation/payment_method/presentation/bank_card_widgets.dart';
import 'package:FOODSTAR/presentation/screens/payment/presentation/payment_method/presentation/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final cartController = Get.put(CartController());
  final paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        builder: (LocationController controller) {
      return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(children: [
                        Text(
                          controller.location.value,
                          style: const TextStyle(color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.bottomSheet(const BottomSheetLocation());
                            },
                            icon: const Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 30,
                            )),
                      ]),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Text(
                    'Оберіть способ оплати',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            paymentController.listPayImage.length,
                            (index) {
                              return Obx(() {
                                return GestureDetector(
                                  onTap: () {
                                    paymentController.changeCurrentIndex(index);
                                  },
                                  child: index ==
                                          paymentController.currentIndex.value
                                      ? PaymentMethod(
                                          imageLogo: paymentController
                                              .listPayImage[index],
                                          title:
                                              paymentController.titlePay[index],
                                          borderColor:
                                              AppColors.additionalcolor,
                                        )
                                      : PaymentMethod(
                                          imageLogo: paymentController
                                              .listPayImage[index],
                                          title:
                                              paymentController.titlePay[index],
                                          colorIcon: Colors.grey,
                                          fontWeight: FontWeight.w200,
                                          borderColor: Colors.grey),
                                );
                              });
                            },
                          ),
                        ),
                      ]),
                ),
                const BankCardWidgets()
              ],
            ),
          ),
        ),
      );
    });
  }
}
