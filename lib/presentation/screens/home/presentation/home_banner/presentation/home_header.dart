import 'dart:math';

import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/domain/models/DishModel.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';
import 'package:FOODSTAR/presentation/screens/home/presentation/home_banner/domain/banner_in_home_controller.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class PageHeader implements SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GetBuilder<HomeBannerController>(
        builder: (HomeBannerController controller) {
      return MaterialApp(
        home: Container(
          color: AppColors.mainColor,
          child: FutureBuilder<List<DishModel>>(
              future: controller.getNewDishMenu(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Ошибка при загрузке данных: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      child: Center(
                          child: Center(child: CircularProgressIndicator())));
                } else {
                  return CarouselSlider.builder(
                    itemCount: controller.newDish.length,
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.detailDish,
                              arguments: controller.newDish[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: maxExtent,
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: titleOpacity(shrinkOffset),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Center(
                                    child: Image.network(
                                      controller.newDish[index].dish_image,
                                      fit: BoxFit.cover,
                                      height: 300,
                                    ),
                                  ),
                                ),
                              ),
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      AppColors.mainColor
                                    ],
                                    stops: const [0.3, 0.9],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.dstIn,
                                child: Container(
                                  height: maxExtent,
                                  color: AppColors.mainColor,
                                ),
                              ),
                              Positioned(
                                  bottom: 20,
                                  left: 0,
                                  child: FittedBox(
                                    child: SizedBox(
                                      height: 80,
                                      width: 350,
                                      child: ListTile(
                                        subtitle: RichText(
                                          text: TextSpan(children: [
                                            WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.middle,
                                              baseline:
                                                  TextBaseline.ideographic,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Text(
                                                    WordLocalizations.by.tr,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.white
                                                          .withOpacity(
                                                              titleOpacity(
                                                                  shrinkOffset)),
                                                    )),
                                              ),
                                            ),
                                            WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.middle,
                                              baseline:
                                                  TextBaseline.ideographic,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Text(
                                                    controller
                                                        .newDish[index].author
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: AppColors
                                                          .additionalcolor
                                                          .withOpacity(
                                                              titleOpacity(
                                                                  shrinkOffset)),
                                                    )),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        title: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white.withOpacity(
                                                  titleOpacity(shrinkOffset)),
                                            ),
                                            children: [
                                              WidgetSpan(
                                                alignment:
                                                    PlaceholderAlignment.middle,
                                                baseline:
                                                    TextBaseline.ideographic,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .additionalcolor
                                                        .withOpacity(
                                                            titleOpacity(
                                                                shrinkOffset)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Text(
                                                      WordLocalizations.New.tr,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.black
                                                            .withOpacity(
                                                                titleOpacity(
                                                                    shrinkOffset)),
                                                      )),
                                                ),
                                              ),
                                              const TextSpan(text: ' '),
                                              TextSpan(
                                                  text: controller
                                                      .newDish[index].title,
                                                  style: const TextStyle(
                                                      fontSize: 20)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1,
                      enlargeCenterPage: true,
                      autoPlayAnimationDuration: const Duration(seconds: 3),
                      autoPlayInterval: const Duration(seconds: 5),
                      enlargeFactor: 0.5,
                      viewportFraction: 1,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                  );
                }
              }),
        ),
      );
    });
  }

  double titleOpacity(double shrinkOffset) {
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
