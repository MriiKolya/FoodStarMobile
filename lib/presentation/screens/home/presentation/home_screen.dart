import 'package:FOODSTAR/presentation/screens/home/presentation/carousel_slider.dart';
import 'package:FOODSTAR/presentation/screens/home/presentation/home_banner/presentation/home_header.dart';
import 'package:FOODSTAR/presentation/screens/main/domain/navitation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../colors/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(builder: (NavController controller) {
      return SafeArea(
        child: CustomScrollView(slivers: [
          SliverPersistentHeader(
            pinned: false,
            floating: true,
            delegate: PageHeader(),
          ),
          SliverGrid.builder(
            itemCount: controller.discound.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: ((context, index) {
              return controller.discound[index];
            }),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 80, left: 20, right: 20, bottom: 80),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          style: TextStyle(fontSize: 14),
                          children: [
                            TextSpan(
                                text: 'Foodstar',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    ' - це ресторан з рецептами вишуканих страв від видатних людей. Страви від зірок голлівуду, акторів театру, футболістів, співаків, художників, та інших видатних людей всього світу. Кожна людина яка мріяла спробувати їжу яку їдять зірки, може зробити це у нашому ресторані!')
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'У нашому ресторані Ви зможете скуштувати страви від:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.additionalcolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const CarouselSliverAuthor(),
                ],
              ),
            ),
          )
        ]),
      );
    });
  }
}
