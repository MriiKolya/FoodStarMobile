// ignore_for_file: must_be_immutable, file_names

import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/presentation/screens/payment/domain/location_controller.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationGoogleMaps extends StatelessWidget {
  LocationGoogleMaps({super.key});

  FocusScopeNode currentFocus = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        builder: (LocationController locationController) {
      return SafeArea(
        bottom: false,
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Stack(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: GoogleMap(
                      rotateGesturesEnabled: false,
                      polylines: locationController.polylines,
                      onMapCreated: (GoogleMapController controller) {
                        controller.setMapStyle(locationController.themeMap);
                        if (locationController
                                .googleMapsController.isCompleted ==
                            false) {
                          locationController.googleMapsController
                              .complete(controller);
                        }
                      },
                      markers: locationController.markers,
                      zoomControlsEnabled: true,
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: locationController.locationRestraurant,
                        zoom: 14.0,
                      ),
                    )),
                Positioned(
                  left: 15,
                  top: 35,
                  child: FadeInLeft(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 300),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          padding: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          icon: const Icon(Icons.arrow_back_ios_outlined,
                              size: 25, color: Colors.white),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 35,
                  child: FadeInRight(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 300),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          alignment: Alignment.center,
                          icon: const Icon(Icons.search,
                              size: 25, color: Colors.white),
                          onPressed: () async {
                            var direction =
                                await locationController.getDirection(
                                    locationController.searchPlace.text);
                            locationController.directionVerification(direction);
                            // final place = await paymentController
                            // .getPlace(paymentController.searchPlace.text);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 80,
                  right: 80,
                  child: SizedBox(
                    width: 250,
                    child: TextField(
                      focusNode: currentFocus,
                      controller: locationController.searchPlace,
                      cursorColor: AppColors.additionalcolor,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Ваша адресса',
                        hintStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w200),
                        fillColor: Colors.black54,
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(148, 255, 0, 0),
                                width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(149, 158, 158, 158),
                                width: 1),
                            borderRadius: BorderRadius.circular(
                                20)), // Add borderRadius here
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.additionalcolor, width: 1),
                            borderRadius: BorderRadius.circular(
                                20)), // Add borderRadius here
                        focusColor: AppColors.additionalcolor,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            locationController.searchPlace.text = '';
                            currentFocus.unfocus();
                            locationController.clearAllInformation('clear');
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 120.0, // отступ от нижнего края
                  right: 20.0,
                  child: FadeInRight(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 300),
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          padding: const EdgeInsets.only(right: 0),
                          icon: const Icon(Icons.home_outlined,
                              size: 40, color: Colors.white),
                          onPressed: () {
                            locationController.gotoFoodStar();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: locationController.show_addinformation.value,
                  child: Positioned(
                    bottom: 120.0,
                    left: 0.0,
                    child: FadeInLeft(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 300),
                      child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: Colors.black54,
                          ),
                          height: 70,
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 10),
                                    child: Text(
                                      'Час доставки'.toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.access_time_filled,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            '${locationController.time_delivery.value} | ${locationController.distance_delivery.value}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextButton(
                                    onPressed: () {
                                      locationController.setLocation(
                                          locationController.searchPlace.text);
                                      Get.back();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: AppColors.additionalcolor,
                                              width: 1)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          'ОК',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
