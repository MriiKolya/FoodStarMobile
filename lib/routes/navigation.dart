import 'package:FOODSTAR/presentation/screens/payment/presentation/checkout_screen.dart';
import 'package:FOODSTAR/presentation/screens/VerificationPhone/ConfirmCode/confirm_sms_code_screen.dart';
import 'package:FOODSTAR/presentation/screens/VerificationPhone/EntryPhone/change_phone_screen.dart';
import 'package:FOODSTAR/presentation/screens/authorization/reset_password/presentation/reset_password_screen.dart';
import 'package:FOODSTAR/presentation/screens/authorization/verification_Email/presentation/verification_Email_screen.dart';
import 'package:FOODSTAR/presentation/screens/detail_dish/presentation/detail_dish.dart';
import 'package:FOODSTAR/presentation/screens/home/presentation/home_screen.dart';
import 'package:FOODSTAR/presentation/screens/menu/presentation/menu_screen.dart';
import 'package:FOODSTAR/presentation/screens/payment/presentation/set_location_with_GoogleMaps.dart';
import 'package:get/route_manager.dart';
import '../presentation/screens/authorization/login/presentation/login_screen.dart';
import '../presentation/screens/main/presentation/main_screen.dart';
import '../presentation/screens/authorization/register/presentation/register_screen.dart';

class AppRoutes {
  // static const String auth = '/';
  static const String verification = '/verificationEmailScreen';
  static const String resetPassword = '/resetPasswordScreen';
  static const String login = '/loginScreen';
  static const String registerUser = '/registerUserScreen';
  static const String main = '/mainScreen';
  static const String home = '/homeScreen';
  static const String detailDish = '/detailDish';
  static const String menu = '/menu';
  static const String changePhone = '/changephone';
  static const String confirmCode = '/confirmCode';
  static const String checkout = '/checkout';
  static const String locationGoogleMaps = '/locationGoogleMaps';
}

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.verification,
        page: (() => const VerificationEmailScreen())),
    GetPage(name: AppRoutes.detailDish, page: (() => DetailPageDishScreen())),
    GetPage(name: AppRoutes.resetPassword, page: (() => ResetPasswordScreen())),
    GetPage(name: AppRoutes.login, page: (() => const LoginScreen())),
    GetPage(name: AppRoutes.registerUser, page: (() => const RegisterScreen())),
    GetPage(name: AppRoutes.main, page: (() => const MainScreen())),
    GetPage(name: AppRoutes.home, page: (() => const HomeScreen())),
    GetPage(name: AppRoutes.menu, page: (() => const MenuScreen())),
    GetPage(name: AppRoutes.changePhone, page: (() => ChangePhoneScreen())),
    GetPage(name: AppRoutes.confirmCode, page: (() => OTPScreen())),
    GetPage(name: AppRoutes.checkout, page: (() => CheckoutScreen())),
    GetPage(
        name: AppRoutes.locationGoogleMaps, page: (() => LocationGoogleMaps())),
  ];
}
