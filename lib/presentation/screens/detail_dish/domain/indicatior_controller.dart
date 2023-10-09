import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageIndicatorController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final opacity = 1.0.obs;
  final maxExtent = 100.0;
  final scrollOffset = 0.0.obs;

  @override
  void onInit() {
    scrollController.addListener(() {
      updateScroll(scrollController.offset);
    });
    update();
    super.onInit();
  }

  void updateScroll(double offset) {
    scrollOffset.value = offset;
    updateOpacity();
    update();
  }

  void updateOpacity() {
    double testOpacity = 1.0 - (scrollOffset.value / maxExtent);
    if (testOpacity >= 0.0 && testOpacity <= 1.0) {
      opacity.value = testOpacity;
      // print(opacity);
      update();
    }
  }

  void goToStartPage() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
