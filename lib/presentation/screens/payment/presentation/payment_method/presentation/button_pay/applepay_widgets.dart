// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class ApplePayButtonWidgets extends StatelessWidget {
  ApplePayButtonWidgets({super.key});

  final Future<PaymentConfiguration> _googlePayConfigFuture =
      PaymentConfiguration.fromAsset('json/apple_pay.json');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaymentConfiguration>(
        future: _googlePayConfigFuture,
        builder: (context, snapshot) => snapshot.hasData
            ? ApplePayButton(
                width: 100,
                height: 100,
                style: ApplePayButtonStyle.black,
                paymentConfiguration: snapshot.data!,
                paymentItems: const [
                  PaymentItem(
                    label: 'Total',
                    amount: '0.1',
                    status: PaymentItemStatus.final_price,
                  )
                ],
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: (result) {
                  print(result);
                },
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                color: Colors.red,
                height: 100,
              ));
  }
}
