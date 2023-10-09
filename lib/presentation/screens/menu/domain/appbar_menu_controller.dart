// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:FOODSTAR/domain/models/DishModel.dart';
import 'package:FOODSTAR/internal/Utils/menu_repository.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarMenuController extends GetxController {
  final searchDish = TextEditingController().obs;
  final focusNode = FocusNode().obs;
  final expandedHeight = 120.0.obs;
  bool isVisibleListSearch = false;
  final dishes = MenuRepository.menu;
  late List<DishModel> dishesforSearch;
  late final bool isFocused;

  @override
  void onInit() {
    searchDish.value.text = '';
    isFocused = focusNode.value.hasFocus;
    dishesforSearch = dishes;
    super.onInit();
  }

  void clear() {
    searchDish.value.text = '';
    update();
    changeExpandedHeight(120);
    isVisibleListSearch = false;
  }

  void changeExpandedHeight(double a) {
    expandedHeight.value = a;
    update();
  }

  void searchTextChange(String value) {
    if (value != '') {
      final suggetstions = dishes.where((dish) {
        final dishTitle = dish.title.toLowerCase();
        final input = value.toLowerCase();
        return dishTitle.contains(input);
      }).toList();
      if (suggetstions.isNotEmpty) {
        switch (suggetstions.length) {
          case 1:
            changeExpandedHeight(180);
            break;
          case 2:
            changeExpandedHeight(240);
            break;
          default:
            changeExpandedHeight(320);
        }
        isVisibleListSearch = true;
        dishesforSearch = suggetstions;
      } else {
        changeExpandedHeight(120);
        isVisibleListSearch = false;
        dishesforSearch.clear();
      }
    } else {
      changeExpandedHeight(120);
      isVisibleListSearch = false;
      dishesforSearch.clear();
    }
    update();
  }
}
