import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/presentation/screens/payment/domain/location_controller.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetLocation extends StatelessWidget {
  const BottomSheetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        builder: (LocationController controller) {
      return Material(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.setLocation('В Ресторанні');
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColors.additionalcolor, width: 1),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'В Ресторанні',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.locationGoogleMaps);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColors.additionalcolor, width: 1),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Обрати локацію',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
