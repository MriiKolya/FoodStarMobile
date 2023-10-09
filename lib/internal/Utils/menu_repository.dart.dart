// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:FOODSTAR/domain/models/DishModel.dart';
import 'package:get/get.dart';

class MenuRepository extends GetxController {
  static MenuRepository get instance => Get.find();
  static List<DishModel> menu = [];
  static var index = 0;
  final menuCollection =
      FirebaseFirestore.instance.collection('MenuForRestaurant');

  Future readAllMenu() async {
    await menuCollection
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              menu.add(DishModel.fromJson(element.data()));
            }));
  }

  Future<List<DishModel>> getCategoreMenu(DishModel dish) async {
    try {
      final List<DishModel> categoreMenu = [];
      List<DishModel> otherDishes = [];

      await menuCollection.get().then((snapshot) {
        snapshot.docs.forEach((element) {
          if (element['categories'] == dish.categoriesDish) {
            DishModel dishModel = DishModel.fromJson(element.data());
            if (dishModel.title == dish.title) {
              categoreMenu.insert(0, dishModel); // Вставляем в начало списка
            } else {
              otherDishes.add(dishModel);
            }
          }
        });
        categoreMenu.addAll(otherDishes);
      });

      return categoreMenu;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<DishModel>> getAllMenu() async {
    try {
      final List<DishModel> menuList = [];
      await menuCollection
          .get()
          .then((snapshot) => snapshot.docs.forEach((element) {
                menuList.add(DishModel.fromJson(element.data()));
              }));
      return menuList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<DishModel>> getNewDishMenu() async {
    final List<DishModel> newDishList = [];
    await menuCollection
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              if (element['new_Dish'] == true) {
                newDishList.add(DishModel.fromJson(element.data()));
              }
            }));
    return newDishList;
  }

  static Map<String, List<DishModel>> get tableByCategories {
    final Map<String, List<DishModel>> table = {};

    for (var dish in menu) {
      if (dish.new_Dish == true) {
        final newDish = DishModel.copy(dish);
        newDish.index = index++;
        table['Що нового ?'] ??= [];
        table['Що нового ?']!.add(newDish);
      }
    }

    for (var dish in menu) {
      final updatedDish = DishModel.copy(dish);
      updatedDish.index = index++;
      if (table.containsKey(updatedDish.categoriesDish)) {
        table[updatedDish.categoriesDish] = [
          updatedDish,
          ...table[updatedDish.categoriesDish]!
        ];
      } else {
        table[updatedDish.categoriesDish] = [updatedDish];
      }
    }

    return table;
  }

  @override
  void onInit() {
    readAllMenu();
    super.onInit();
  }
}

String capitalize(String str) {
  return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
}
