// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class GooglePayButtonWidgets extends StatelessWidget {
  GooglePayButtonWidgets({super.key});

  final Future<PaymentConfiguration> _googlePayConfigFuture =
      PaymentConfiguration.fromAsset('json/google_pay.json');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaymentConfiguration>(
        future: _googlePayConfigFuture,
        builder: (context, snapshot) => snapshot.hasData
            ? GooglePayButton(
                paymentConfiguration: snapshot.data!,
                paymentItems: const [
                  PaymentItem(
                    label: 'Total',
                    amount: '99.99',
                    status: PaymentItemStatus.final_price,
                  )
                ],
                type: GooglePayButtonType.buy,
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
