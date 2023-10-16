// ignore_for_file: avoid_print

import 'package:FOODSTAR/domain/models/DishModel.dart';
import 'package:FOODSTAR/internal/Utils/menu_repository.dart.dart';
import 'package:get/get.dart';

class HomeBannerController extends GetxController {
  var newDish = <DishModel>[].obs;

  Future<List<DishModel>> getNewDishMenu() async {
    try {
      final data = await MenuRepository.instance.getNewDishMenu();
      newDish.assignAll(data);
      return data;
    } catch (error) {
      print('Ошибка при загрузке данных: $error');
      return [];
    }
  }
}
