import 'package:FOODSTAR/internal/Utils/menu_repository.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final itemPosListener = ItemPositionsListener.create();
  final scrollController = ItemScrollController();
  final table = MenuRepository.tableByCategories;

  late final tabController = TabController(
    length: table.keys.length,
    vsync: this,
  );

  int uniqueTagForDish = 0;

  

  @override
  void onInit() {
    itemPosListener.itemPositions.addListener(() {
      final newCreatedItems = <int>[];
      for (var position in itemPosListener.itemPositions.value) {
        newCreatedItems.add(position.index);
      }
      newCreatedItems.sort();
      if (newCreatedItems.isNotEmpty) {
        var index = newCreatedItems.first;
        if (tabController.index != index && !tabController.indexIsChanging) {
          tabController.animateTo(index);
        }
      }
    });
    super.onInit();
  }
}
