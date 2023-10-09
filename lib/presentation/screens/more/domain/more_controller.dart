import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreController extends GetxController {
  var text = "More".obs;

  @override
  void onInit() {
    text.value = "More";
    super.onInit();
  }

  void goToInstagram() async {
    await launchUrl(
      Uri.parse(
          'https://www.instagram.com/_foodstar_restaurant_/?igshid=MzRlODBiNWFlZA%3D%3D'),
      mode: LaunchMode.inAppWebView,
    );
  }
}
