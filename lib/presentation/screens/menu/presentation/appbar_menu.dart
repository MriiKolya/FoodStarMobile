import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/presentation/screens/menu/domain/appbar_menu_controller.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppBarMenu extends StatelessWidget {
  const AppBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppBarMenuController>(
        builder: (AppBarMenuController controller) {
      return SliverAppBar(
        automaticallyImplyLeading: false,
        expandedHeight: controller.expandedHeight.value,
        backgroundColor: AppColors.mainColor,
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInDown(
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(54, 54, 54, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 400,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(Icons.search, color: Colors.white),
                      ),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                              controller.searchTextChange(value);
                            },
                            controller: controller.searchDish.value,
                            textAlign: TextAlign.left,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.white70,
                                  ),
                                  onPressed: controller.clear,
                                ),
                                hintText: "Пошук страв...",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Visibility(
                    visible: controller.isVisibleListSearch,
                    child: ListView.builder(
                        itemCount: controller.dishesforSearch.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Get.toNamed(AppRoutes.detailDish,
                                  arguments: controller.dishesforSearch[index]);
                            },
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.dishesforSearch[index].title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    controller
                                        .dishesforSearch[index].categoriesDish,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ]),
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(controller
                                    .dishesforSearch[index].dish_image)),
                          );
                        })),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Text(
                'Категорії',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      );
    });
  }
}
