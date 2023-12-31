import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:FOODSTAR/presentation/screens/payment/domain/location_controller.dart';
import 'package:FOODSTAR/presentation/screens/payment/presentation/payment_method/domain/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BankCardWidgets extends StatelessWidget {
  BankCardWidgets({super.key, required this.locationController});

  final LocationController locationController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
        builder: (PaymentController controller) {
      return SizedBox(
        height: 300,
        width: 400,
        child: CreditCardForm(
          obscureCvv: true,
          obscureNumber: false,
          expiryDate: controller.expiryDate.value,
          cardHolderName: controller.cardHolder.value,
          cardNumber: controller.BankNumber.value,
          cvvCode: controller.CVV.value,
          onFormComplete: () {
            locationController.isformWritten(true);
          },
          inputConfiguration: InputConfiguration(
            cardHolderTextStyle: const TextStyle(color: Colors.white),
            cvvCodeTextStyle: const TextStyle(color: Colors.white),
            cardNumberTextStyle: const TextStyle(color: Colors.white),
            expiryDateTextStyle: const TextStyle(color: Colors.white),
            cardNumberDecoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 0.5)),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.additionalcolor, width: 1)),
              labelText: 'Номер',
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white),
              hintText: 'XXXX XXXX XXXX XXXX',
            ),
            expiryDateDecoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 0.5)),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.additionalcolor, width: 1)),
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white),
              labelText: 'Термін дії',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 0.5)),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.additionalcolor, width: 1)),
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white),
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: InputDecoration(
              labelText: 'Власник карти',
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 0.5)),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.additionalcolor, width: 1)),
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white),
            ),
          ),
          onCreditCardModelChange: (p0) {},
          formKey: formKey,
        ),
      );
    });
  }
}
