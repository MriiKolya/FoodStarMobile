// ignore_for_file: avoid_print

import 'package:FOODSTAR/domain/models/DishModel.dart';
import 'package:FOODSTAR/internal/Utils/menu_repository.dart.dart';
import 'package:get/get.dart';

class CarouselSliverAuthorController extends GetxController {
  var authorList = <DishModel>[].obs;

  Future<List<DishModel>> fetchAuthorList() async {
    try {
      final data = await MenuRepository.instance.getAllMenu();
      authorList.assignAll(data);
      return data;
    } catch (error) {
      print('Ошибка при загрузке данных: $error');
      return [];
    }
  }
}
