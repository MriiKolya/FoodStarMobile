import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/presentation/screens/main/domain/navitation_controller.dart';
import 'package:FOODSTAR/presentation/screens/main/presentation/navitation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(builder: (NavController controller) {
      return Scaffold(
          body: controller.pages[controller.selectedIndex.value],
          backgroundColor: AppColors.mainColor,
          bottomNavigationBar: const NavigationBarT());
    });
  }
}
