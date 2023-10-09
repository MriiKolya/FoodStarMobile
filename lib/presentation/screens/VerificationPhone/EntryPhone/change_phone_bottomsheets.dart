import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/presentation/screens/VerificationPhone/domain/bottomsheet_phonecode_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BottomSheetsPhone extends StatelessWidget {
  const BottomSheetsPhone({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhoneCodeController>(
        builder: (PhoneCodeController controller) {
      return Material(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40, top: 40, bottom: 20),
                  child: Text(
                    'Код країни',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: controller.searchCountryController.value,
                onChanged: (value) {
                  controller.searchCountry(value);
                },
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color.fromARGB(47, 255, 255, 255),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.additionalcolor,
                      width: 0.3,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white70,
                  ),
                  hintText: 'Пошук країни...',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontStyle: FontStyle.italic,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.countriesForSearch.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        controller.countriesForSearch[index].flag,
                        fit: BoxFit.contain,
                        scale: 8,
                      ),
                    ),
                    title: Text(
                      controller.countriesForSearch[index].phoneCode,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: FittedBox(
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          controller.countriesForSearch[index].name,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    onTap: () {
                      controller.changeSelectCountry(
                          controller.countriesForSearch[index]);
                      Get.back();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
