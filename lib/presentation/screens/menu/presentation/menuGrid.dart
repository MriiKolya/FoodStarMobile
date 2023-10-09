// ignore_for_file: file_names
import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/words_Localization.dart';
import 'package:FOODSTAR/internal/Utils/menu_repository.dart.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuGrid extends StatefulWidget {
  const MenuGrid({super.key});

  @override
  State<MenuGrid> createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> with TickerProviderStateMixin {
  final itemPosListener = ItemPositionsListener.create();
  final scrollController = ItemScrollController();
  final table = MenuRepository.tableByCategories;
  var index = 0;

  late final tabController = TabController(
    length: table.keys.length,
    vsync: this,
  );

  @override
  void initState() {
    itemPosListener.itemPositions.addListener(() {
      final newCreatedItems = <int>[];
      for (var position in itemPosListener.itemPositions.value) {
        newCreatedItems.add(position.index);
      }
      newCreatedItems.sort();
      if (newCreatedItems.isNotEmpty) {
        index = newCreatedItems.first;
        if (tabController.index != index && !tabController.indexIsChanging) {
          tabController.animateTo(index);
        }
      }
    });

    tabController.addListener(() {
      setState(() {
        tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          onTap: (value) {
            scrollController.scrollTo(
              index: tabController.index,
              duration: const Duration(milliseconds: 300),
            );
          },
          labelColor: AppColors.additionalcolor,
          unselectedLabelColor: Colors.black,
          labelStyle: const TextStyle(fontSize: 16),
          unselectedLabelStyle: const TextStyle(fontSize: 16),
          indicator: BoxDecoration(
            color: AppColors.mainColor,
            border: Border.all(width: 1, color: AppColors.additionalcolor),
            borderRadius: BorderRadius.circular(12),
          ),
          controller: tabController,
          isScrollable: true,
          tabs: List.generate(
            table.keys.length,
            (index) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: tabController.index == index
                      ? Colors.transparent
                      : AppColors.additionalcolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                child: Center(
                  child: FittedBox(
                    child: Text(
                      table.keys.toList()[index].toString(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ScrollablePositionedList.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemScrollController: scrollController,
            padding: const EdgeInsets.all(16.0),
            itemPositionsListener: itemPosListener,
            itemCount: table.keys.length,
            itemBuilder: (context, index) {
              final title = table.keys.toList()[index];
              final dishes = table.values.toList()[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 10),
                    child: Text(
                      title.toString(),
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: title.toString() == 'Що нового ?'
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: title.toString() == 'Що нового ?'
                              ? AppColors.additionalcolor
                              : Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MasonryGrid(
                    column: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: List.generate(dishes.length, (index) {
                      final dish = dishes[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.detailDish, arguments: dish);
                        },
                        child: Hero(
                          transitionOnUserGestures: true,
                          tag: dish.index,
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  dish.dish_image,
                                  height: 120,
                                  width: 180,
                                  loadingBuilder:
                                      (context, child, loadingProgress) =>
                                          loadingProgress == null
                                              ? child
                                              : const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text: dish.title,
                                    style: const TextStyle(fontSize: 18),
                                    children: [
                                      TextSpan(
                                          text: ' ${WordLocalizations.by.tr} '),
                                      TextSpan(
                                          text: dish.author,
                                          style: TextStyle(
                                              color:
                                                  AppColors.additionalcolor)),
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
