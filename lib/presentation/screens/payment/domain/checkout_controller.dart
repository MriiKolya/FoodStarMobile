import 'dart:ui';

import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final isFinishButon = false.obs;
  final buttonColor = AppColors.additionalcolor.obs;

  void changeFinishButon(bool value) {
    isFinishButon.value = value;
    update();
  }

  void changeButtonColor(Color color) {
    buttonColor.value = color;
    update();
  }
}
