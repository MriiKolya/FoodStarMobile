import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/presentation/screens/payment/domain/checkout_controller.dart';
import 'package:FOODSTAR/presentation/screens/payment/domain/location_controller.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

class SuccessScren extends StatelessWidget {
  SuccessScren({super.key});

  final checkoutController = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        builder: (LocationController locationController) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 200),
                      Center(
                        child: Lottie.asset(
                            'assets/lotties_assets/successful.json',
                            repeat: false),
                      ),
                      const Text(
                        'Платіж успішно здійснено',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 200),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    fixedSize: const Size(180, 55),
                                    backgroundColor: AppColors.additionalcolor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(AppRoutes.main);
                                    checkoutController
                                        .buttonColor(AppColors.additionalcolor);
                                  },
                                  child: const Text(
                                    'Меню',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    fixedSize: const Size(180, 55),
                                    backgroundColor: AppColors.additionalcolor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: TextButton(
                                  onPressed: () {
                                    checkoutController
                                        .buttonColor(AppColors.additionalcolor);
                                  },
                                  child: const FittedBox(
                                    child: Text(
                                      'Історія транзакції',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
        })),
      );
    });
  }
}
