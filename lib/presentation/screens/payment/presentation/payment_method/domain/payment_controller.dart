// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final bankCartNumber = TextEditingController();
  final currentIndex = 0.obs;
  final showBankCardForm = true.obs;

  final cardHolder = ''.obs;
  final BankNumber = ''.obs;
  final expiryDate = ''.obs;
  final CVV = ''.obs;

  final List<String> listPayImage = [
    'assets/paymentImage/credit_card.png',
    'assets/paymentImage/apple.png',
    'assets/paymentImage/google.png',
  ];
  final List<String> titlePay = [
    'Банківська карта',
    'Apple Pay',
    'Google Pay',
  ];
  changeCurrentIndex(int index) {
    currentIndex.value = index;
    if (index == 0) //0 index BankCard
    {
      showBankCardForm.value = true;
    } else {
      showBankCardForm.value = false;
    }
    update();
  }
}
