// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/domain/models/DishModel.dart';
import 'package:FOODSTAR/presentation/screens/detail_dish/domain/detail_dish.controller.dart';
import 'package:FOODSTAR/presentation/screens/detail_dish/domain/indicatior_controller.dart';
import 'package:FOODSTAR/presentation/screens/detail_dish/presentation/widgets/cart_Icon.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SLiverAppBarDish extends StatelessWidget {
  SLiverAppBarDish({
    super.key,
    required this.dish,
    required this.detaildishcontroller,
    required this.pageIndicatorController,
  });

  final DishModel dish;
  final DetailDishController detaildishcontroller;
  final PageIndicatorController pageIndicatorController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 90,
      automaticallyImplyLeading: false,
      expandedHeight: 450,
      pinned: true,
      floating: true,
      backgroundColor: AppColors.mainColor,
      leading: FadeInLeft(
        duration: const Duration(milliseconds: 500),
        delay: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black54,
              child: IconButton(
                padding: const EdgeInsets.only(right: 5),
                alignment: Alignment.center,
                icon: const Icon(Icons.arrow_back_ios_outlined,
                    color: Colors.white),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        ),
      ),
      actions: const [
        // FavotiresIcon(dish: dish,),
        CartIcon(),
      ],
      flexibleSpace: FlexibleSpaceBar(
          background: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: dish.index,
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      // borderRadius: const BorderRadius.all(Radius.circular(60)),
                      child: SizedBox(
                        width: double.maxFinite,
                        height: 300,
                        child: Image.network(
                          dish.dish_image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: [Colors.transparent, AppColors.mainColor],
                          stops: const [0.6, 0.9],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Container(
                        height: 310,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ]),
                ),
                Obx(
                  () => SmoothPageIndicator(
                    effect: SwapEffect(
                        activeDotColor: AppColors.additionalcolor,
                        dotHeight: 14,
                        dotWidth: 14),
                    controller: detaildishcontroller.pageController,
                    count: detaildishcontroller.categoryDish.length,
                  ),
                ),
              ]),
          title: GestureDetector(
            onTap: () {
              pageIndicatorController.goToStartPage();
            },
            child: FadeInDown(
              duration: const Duration(milliseconds: 500),
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 20, bottom: 15),
                child: FittedBox(
                  child: SizedBox(
                    width: 300,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: dish.title.toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
