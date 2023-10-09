import 'package:FOODSTAR/internal/Utils/menu_repository.dart.dart';
import 'package:FOODSTAR/presentation/screens/payment/domain/location_controller.dart';
import 'package:FOODSTAR/presentation/screens/authorization/login/domain/login_controller.dart';
import 'package:FOODSTAR/presentation/screens/authorization/reset_password/domain/change_password_controller.dart';
import 'package:FOODSTAR/presentation/screens/detail_dish/domain/detail_dish.controller.dart';
import 'package:FOODSTAR/presentation/screens/detail_dish/domain/indicatior_controller.dart';

import 'package:FOODSTAR/presentation/screens/home/domain/carousel_slider.controller.dart';
import 'package:FOODSTAR/presentation/screens/home/presentation/home_banner/domain/banner_in_home_controller.dart';

import 'package:FOODSTAR/presentation/screens/main/domain/navitation_controller.dart';
import 'package:FOODSTAR/presentation/screens/authorization/register/domain/register_controller.dart';
import 'package:FOODSTAR/presentation/screens/authorization/verification_Email/domain/verification_Email_controller.dart';
import 'package:FOODSTAR/presentation/screens/menu/domain/appbar_menu_controller.dart';
import 'package:FOODSTAR/presentation/screens/menu/domain/tabbar_custom_controller.dart';

import 'package:FOODSTAR/components/cart_widget/domain/cart_controller.dart';
import 'package:FOODSTAR/presentation/screens/VerificationPhone/domain/bottomsheet_phonecode_controller.dart';
import 'package:FOODSTAR/presentation/screens/payment/presentation/payment_method/domain/payment_controller.dart';
import 'package:get/get.dart';

class ControllerBinds implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());

    Get.put(RegisterContoller());

    Get.lazyPut<VerificationEmailController>(
        () => VerificationEmailController());

    Get.lazyPut<DetailDishController>(() => DetailDishController());

    Get.lazyPut<NavController>(() => NavController());

    Get.put(TabBarController());

    Get.put(AppBarMenuController());

    Get.put(PhoneCodeController());

    Get.put(PaymentController());

    Get.lazyPut<MenuRepository>(() => MenuRepository());
    Get.put(MenuRepository());

    Get.put(PageIndicatorController());
    Get.put(LocationController());

    Get.put(ChangePasswordController());

    Get.put(CarouselSliverAuthorController());
    Get.put(HomeBannerController());

    // Get.put(CartController);
    Get.lazyPut<CartController>(() => CartController());
  }
}
