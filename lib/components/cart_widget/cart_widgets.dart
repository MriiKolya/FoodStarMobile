import 'package:flutter/material.dart';
import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../colors/app_colors.dart';
import '../../internal/Utils/flutter_font.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (CartController controller) {
      return Badge(
        backgroundColor: AppColors.additionalcolor,
        isLabelVisible: controller.cart.value.itemCount != 0,
        label: Text(
          '${controller.cart.value.itemCount}',
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
        child: const Icon(
          FlutterFontIcons.basketIcon,
          color: Colors.white,
          size: 20,
        ),
      );
    });
  }
}
