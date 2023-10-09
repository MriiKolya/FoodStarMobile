import 'package:flutter/material.dart';
import 'package:FOODSTAR/internal/Utils/bindings.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/localization.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppLocalization(),
      // locale: Get.deviceLocale,
      // locale: const Locale('en', 'Us'),
      locale: const Locale('uk', 'UA'),
      fallbackLocale: const Locale('uk', 'UA'),
      theme: darktheme,
      initialRoute: AppRoutes.login,
      initialBinding: ControllerBinds(),
      getPages: AppPages.pages,
      navigatorKey: Get.key,
      darkTheme: ThemeData.light(),
    );
  }
}
