import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final bankCartNumber = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> listPayImage = [
    'assets/paymentImage/credit_card.png',
    'assets/paymentImage/apple.png',
    'assets/paymentImage/google.png',
  ];
  final List<String> titlePay = [
    'Банківска карта',
    'Apple Pay',
    'Google Pay',
  ];

  final currentIndex = 0.obs;

  changeCurrentIndex(int index) {
    currentIndex.value = index;
    update();
  }
}
