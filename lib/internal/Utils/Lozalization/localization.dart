import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/en_US.dart';
import 'package:FOODSTAR/internal/Utils/Lozalization/Languages/uk_UA.dart';
import 'package:get/get.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'uk_UA': ukraine,
      };
}
