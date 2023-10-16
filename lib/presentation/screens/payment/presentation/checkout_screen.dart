// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks
import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';

import 'package:FOODSTAR/presentation/screens/payment/domain/checkout_controller.dart';
import 'package:FOODSTAR/presentation/screens/payment/domain/location_controller.dart';
import 'package:FOODSTAR/presentation/screens/payment/presentation/Screen/bottomshield_take_location.dart';

import 'package:FOODSTAR/presentation/screens/payment/presentation/payment_method/domain/payment_controller.dart';
import 'package:FOODSTAR/presentation/screens/payment/presentation/payment_method/presentation/bank_card_widgets.dart';
import 'package:FOODSTAR/presentation/screens/payment/presentation/payment_method/presentation/payment.dart';
import 'package:FOODSTAR/routes/navigation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:swipeable_button_view/swipeable_button_view.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final cartController = Get.put(CartController());
  final paymentController = Get.put(PaymentController());
  final checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        builder: (LocationController locationController) {
      return Scaffold(
        body: WillPopScope(
          onWillPop: () async => false,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth,
                  ),
                  child: DecoratedBox(
                    position: DecorationPosition.background,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover,
                    )),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                Row(children: [
                                  Text(
                                    locationController.location.value,
                                    style: TextStyle(
                                        color:
                                            locationController.location.value ==
                                                    'Оберіть локацію'
                                                ? Colors.red
                                                : Colors.white),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Get.bottomSheet(
                                            const BottomSheetLocation());
                                      },
                                      icon: const Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                ]),
                              ],
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, top: 20, bottom: 20),
                                    child: Text(
                                      'Оберіть спосіб оплати',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Obx(() {
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: List.generate(
                                                paymentController
                                                    .listPayImage.length,
                                                (index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      paymentController
                                                          .changeCurrentIndex(
                                                              index);
                                                    },
                                                    child: index ==
                                                            paymentController
                                                                .currentIndex
                                                                .value
                                                        ? PaymentMethod(
                                                            imageLogo:
                                                                paymentController
                                                                        .listPayImage[
                                                                    index],
                                                            title:
                                                                paymentController
                                                                        .titlePay[
                                                                    index],
                                                            borderColor: AppColors
                                                                .additionalcolor,
                                                          )
                                                        : PaymentMethod(
                                                            imageLogo:
                                                                paymentController
                                                                        .listPayImage[
                                                                    index],
                                                            title:
                                                                paymentController
                                                                        .titlePay[
                                                                    index],
                                                            colorIcon:
                                                                Colors.grey,
                                                            fontWeight:
                                                                FontWeight.w200,
                                                            borderColor:
                                                                Colors.grey),
                                                  );
                                                },
                                              ),
                                            ),
                                          ]),
                                    );
                                  })
                                ]),
                            Obx(() => paymentController.showBankCardForm == true
                                ? Column(
                                    children: [
                                      BankCardWidgets(
                                        locationController: locationController,
                                      ),
                                      Center(
                                        child: SwipeableButtonView(
                                          isActive: locationController
                                              .isVisiableButton.value,
                                          disableColor: Colors.grey.shade500,
                                          buttonText:
                                              'ОПЛАТИТИ ${cartController.getCurrentTotalCost} грн',
                                          buttontextstyle: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          buttonWidget: const SizedBox(
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.black,
                                            ),
                                          ),
                                          indicatorColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  AppColors.mainColor),
                                          buttonColor: Colors.white,
                                          activeColor: checkoutController
                                              .buttonColor.value,
                                          isFinished: checkoutController
                                              .isFinishButon.value,
                                          onFinish: () async {
                                            Get.toNamed(
                                                AppRoutes.successScrenPay);
                                            checkoutController
                                                .changeFinishButon(false);
                                            cartController.clearCart();
                                          },
                                          onWaitingProcess: () async {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 2000), () {
                                              checkoutController
                                                  .changeButtonColor(
                                                      AppColors.mainColor);
                                              checkoutController
                                                  .changeFinishButon(true);
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  )
                                : const SizedBox()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
