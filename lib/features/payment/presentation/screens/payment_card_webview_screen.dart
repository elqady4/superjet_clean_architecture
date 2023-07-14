import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:suberjet_clean_architecture/api/payment_endpoints.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';
import 'package:suberjet_clean_architecture/core/widgets/center_msg.dart';

import '../cubites/card_payment_cubit/cubit/card_payment_cubit.dart';

class PaymentCardWebViewScreen extends StatelessWidget {
  const PaymentCardWebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        const snackBar = SnackBar(
          content: Text('You can`t go back'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(AppStrings.paymetTitle),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.exit_to_app))
          ],
        ),
        body: BlocBuilder<CardPaymentCubit, CardPaymentState>(
          builder: (context, state) {
            if (state is CardPaymentLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CardPaymentFailure) {
              return const Center(
                child: CenterHintMsg(msg: AppStrings.thirdStepPaymetFail),
              );
            } else if (state is CardPaymentLoaded) {
              return InAppWebView(
                initialUrlRequest: URLRequest(
                    url: Uri.parse(
                        '${PaymentEndPoints.iFrameCardEndpoint}=${state.paymentKeyCard}')),
              );
            } else {
              return const Center(
                child: CenterHintMsg(msg: AppStrings.unexpectedError),
              );
            }
          },
        ),
      ),
    );
  }
}
