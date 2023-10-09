import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';
import 'package:FOODSTAR/presentation/screens/main/domain/navitation_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartIsEmpty extends StatelessWidget {
  const CartIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(builder: (NavController controller) {
      return FadeInDown(
        duration: const Duration(milliseconds: 500),
        delay: const Duration(milliseconds: 300),
        child: Column(
          children: [
            const SizedBox(height: 140),
            Image.asset(
              'assets/images/empty_cart.png',
              scale: 2.3,
              color: Colors.white,
            ),
            const SizedBox(height: 100),
            Center(
                child: Text(
              WordLocalizations.CartEmpty.tr,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
            const SizedBox(height: 20),
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Text(
                WordLocalizations.CartEmptyMessange.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.white),
              ),
            )),
            const SizedBox(height: 50),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    backgroundColor: AppColors.additionalcolor,
                  ),
                  onPressed: () {
                    controller.setSelectedIndex(2);
                  },
                  child: Text(
                    WordLocalizations.Menu.tr.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            )
          ],
        ),
      );
    });
  }
}
