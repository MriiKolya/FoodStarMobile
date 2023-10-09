import 'package:FOODSTAR/components/cart_widget/cart_widgets.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';
import 'package:FOODSTAR/internal/Utils/flutter_font.dart';
import 'package:FOODSTAR/presentation/screens/main/domain/navitation_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationBarT extends StatelessWidget {
  const NavigationBarT({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(builder: (NavController controller) {
      return SafeArea(
        child: GNav(
          iconSize: 20,
          selectedIndex: controller.selectedIndex.value,
          onTabChange: (index) {
            controller.setSelectedIndex(index);
          },
          gap: 4,
          backgroundColor: Colors.transparent,
          tabActiveBorder: Border.all(
              strokeAlign: BorderSide.strokeAlignCenter,
              color: const Color.fromRGBO(254, 193, 35, 1),
              width: 1),
          tabs: [
            GButton(
              icon: FlutterFontIcons.homeIcon,
              text: WordLocalizations.Home.tr,
              iconColor: Colors.white,
              textStyle: const TextStyle(color: Colors.white),
              iconActiveColor: Colors.white,
            ),
            GButton(
                leading: const Padding(
                    padding: EdgeInsets.only(right: 5), child: CartWidget()),
                icon: FlutterFontIcons.basketIcon,
                textStyle: const TextStyle(color: Colors.white),
                text: WordLocalizations.Cart.tr),
            GButton(
              icon: Icons.restaurant_menu,
              text: WordLocalizations.Menu.tr,
              iconColor: Colors.white,
              iconActiveColor: Colors.white,
              textStyle: const TextStyle(color: Colors.white),
            ),
            GButton(
              icon: FlutterFontIcons.profileIcon,
              text: WordLocalizations.Profile.tr,
              iconSize: 15,
              iconColor: Colors.white,
              textStyle: const TextStyle(color: Colors.white),
              iconActiveColor: Colors.white,
            ),
            GButton(
              icon: Icons.more_horiz,
              text: WordLocalizations.More.tr,
              iconColor: Colors.white,
              textStyle: const TextStyle(color: Colors.white),
              iconActiveColor: Colors.white,
            ),
          ],
        ),
      );
    });
  }
}
