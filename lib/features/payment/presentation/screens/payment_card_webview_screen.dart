import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:suberjet_clean_architecture/api/payment_endpoints.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/config/routes/routes.dart';
import 'package:suberjet_clean_architecture/core/widgets/center_msg.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/screens/payment_resultl_screen.dart';

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
          title: Text(AppLocalizations.of(context)!.translate('paymetTitle')!),
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
              return Center(
                child: CenterHintMsg(
                    msg: AppLocalizations.of(context)!
                        .translate('thirdStepPaymetFail')!),
              );
            } else if (state is CardPaymentLoaded) {
              InAppWebViewController? _controller;
              return InAppWebView(
                initialUrlRequest: URLRequest(
                    url: Uri.parse(
                        '${PaymentEndPoints.iFrameCardEndpoint}=${state.paymentKeyCard}')),
                onWebViewCreated: (InAppWebViewController controller) {
                  _controller = controller;
                },
                onLoadStart: (InAppWebViewController controller, Uri? url) {
                  // Check if payment was successful
                  if (url?.toString().contains('success=true') ?? true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentResultScreen(
                              isSuccess: true,
                              msg: AppLocalizations.of(context)!
                                  .translate('paymentSuccess')!),
                        ));
                    // Pop all routes until the first screen to go back to the home screen
                  } else if (url?.toString().contains('success=false') ??
                      true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentResultScreen(
                              isSuccess: false,
                              msg: AppLocalizations.of(context)!
                                  .translate('paymentfail')!),
                        ));
                  }
                },
              );
            } else {
              return Center(
                child: CenterHintMsg(
                    msg: AppLocalizations.of(context)!
                        .translate('unexpectedError')!),
              );
            }
          },
        ),
      ),
    );
  }
}
