import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/presentation/screens/detail_dish/domain/detail_dish.controller.dart';
import 'package:FOODSTAR/presentation/screens/detail_dish/domain/indicatior_controller.dart';
import 'package:FOODSTAR/presentation/screens/detail_dish/presentation/widgets/appbar_dish_screen.dart';
import 'package:FOODSTAR/presentation/screens/detail_dish/presentation/widgets/info_screen_dish.dart';
import 'package:FOODSTAR/presentation/screens/main/domain/navitation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPageDishScreen extends StatelessWidget {
  final detaildishcontroller = Get.put(DetailDishController());
  final List<PageIndicatorController> pageIndicatorControllers = [];
  final controller = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return PageView.builder(
                  controller: detaildishcontroller.pageController,
                  itemCount: detaildishcontroller.categoryDish.length,
                  onPageChanged: (index) {
                    detaildishcontroller.setIndex(index);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    pageIndicatorControllers
                        .add(Get.put(PageIndicatorController()));
                    return CustomScrollView(
                      controller:
                          pageIndicatorControllers[index].scrollController,
                      slivers: [
                        SLiverAppBarDish(
                          dish: detaildishcontroller.categoryDish[index],
                          detaildishcontroller: detaildishcontroller,
                          pageIndicatorController:
                              pageIndicatorControllers[index],
                        ),
                        SliverToBoxAdapter(
                          child: MainInfoDish(
                            dish: detaildishcontroller.categoryDish[index],
                          ),
                        ),
                      ],
                    );
                  });
            } else {
              return const Center(
                child: Text('Error loading data'),
              );
            }
          },
        ),
      ),
    );
  }
}
