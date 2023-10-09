// ignore_for_file: avoid_print

import 'package:FOODSTAR/domain/models/CountryModel.dart';
import 'package:FOODSTAR/internal/Utils/authentication_repository.dart';
import 'package:FOODSTAR/routes/navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneCodeController extends GetxController {
  final maskPhoneFormatter = MaskTextInputFormatter(
      mask: '(##) ### - ## - ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final maskCodeFormatter = MaskTextInputFormatter(
      mask: '# # # # # #',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final phoneKey = GlobalKey<FormState>();
  final codeKey = GlobalKey<FormState>();
  final searchCountryController = TextEditingController().obs;
  final phoneNumberController = TextEditingController();
  final codeController = TextEditingController();
  RxList<CountryModel> countries = <CountryModel>[].obs;
  RxBool isLoading = true.obs;
  RxList<CountryModel> countriesForSearch = <CountryModel>[].obs;

  Rx<CountryModel> selectCountry =
      Rx<CountryModel>(CountryModel.defaultCountry());

  final String apiUrl = 'https://restcountries.com/v3.1/all';

  @override
  void onInit() {
    super.onInit();
    getAllCountries();
  }

  void searchCountry(String value) {
    if (value.isNotEmpty) {
      final input = value.toLowerCase();
      final suggestions = countries
          .where((country) => country.name.toLowerCase().contains(input))
          .toList();
      countriesForSearch.assignAll(suggestions);
    } else {
      countriesForSearch.assignAll(countries);
    }
    update();
  }

  void changeSelectCountry(CountryModel country) {
    selectCountry.value = country;
    update();
  }

  Future<void> getAllCountries() async {
    try {
      final response = await Dio().get(apiUrl);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        String specialCountryNames = 'null';
        List<CountryModel> countryModels =
            data.map((item) => CountryModel.fromJson(item)).toList();
        countryModels.removeWhere(
            (country) => specialCountryNames.contains(country.name));
        countries.assignAll(countryModels);

        isLoading.value = false;

        selectCountry.value =
            countries.firstWhere((country) => country.name == 'Ukraine');
        countriesForSearch.assignAll(countries);
        update();
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void phoneVerification() {
    final phoneNumber =
        selectCountry.value.phoneCode + maskPhoneFormatter.getUnmaskedText();
    AuthenticationRepository.instance.verificationPhone(phoneNumber);
    print(phoneNumber);
    Get.toNamed(AppRoutes.confirmCode);
  }

  void confirmCode() {
    final phoneNumber =
        selectCountry.value.phoneCode + maskPhoneFormatter.getUnmaskedText();
    AuthenticationRepository.instance
        .verifyCode(maskCodeFormatter.getUnmaskedText(), phoneNumber);
  }
}
