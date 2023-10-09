// ignore_for_file: avoid_print

import 'package:FOODSTAR/presentation/screens/main/domain/navitation_controller.dart';
import 'package:flutter/material.dart';
import 'package:FOODSTAR/colors/app_colors.dart';

import 'package:FOODSTAR/presentation/screens/more/domain/more_controller.dart';
import 'package:FOODSTAR/presentation/screens/profile_User/presentation/buttonEdit.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MoreController());
    final switchTabbar = Get.put(NavController());
    return GetBuilder<MoreController>(builder: (MoreController controller) {
      {
        return SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.mainColor,
              body: Center(
                child: Column(
                  children: [
                    ButtonEdit(
                        function: () {},
                        buttonText: 'Сайт',
                        buttonColor: Colors.white),
                    ButtonEdit(
                        function: () {
                          controller.goToInstagram();
                          print('object');
                        },
                        buttonText: 'Інстаграм',
                        buttonColor: Colors.white),
                    ButtonEdit(
                        function: () {},
                        buttonText: "Зворотній звя'язок",
                        buttonColor: Colors.white),
                    ButtonEdit(
                        function: () {
                          switchTabbar.setSelectedIndex(0);
                        },
                        buttonText: 'Про нас',
                        buttonColor: Colors.white),
                  ],
                ),
              )),
        );
      }
    });
  }
}
