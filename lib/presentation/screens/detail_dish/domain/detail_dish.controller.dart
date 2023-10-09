import 'package:FOODSTAR/domain/models/DishModel.dart';
import 'package:FOODSTAR/internal/Utils/menu_repository.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailDishController extends GetxController {
  final pageController = PageController();
  final categoryDish = [].obs;
  DishModel argumentDish = Get.arguments;
  var currentIndex = 0.obs;

  void setIndex(int index) {
    currentIndex.value = index;
    update();
  }

  void nextPage() {
    currentIndex.value++;
    update();
  }

  void previousPage() {
    if (currentIndex > 0) {
      currentIndex.value--;
      update();
    }
  }

  @override
  void onInit() async {
    await updateCategoryDish();
    setIndex(0);
    super.onInit();
  }

  updateCategoryDish() async {
    categoryDish.value =
        await MenuRepository.instance.getCategoreMenu(argumentDish);
    update();
  }
}
