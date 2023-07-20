import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/core/widgets/center_msg.dart';

import '../cubites/wallet_payment_cubit/cubit/wallet_payment_cubit.dart';

class PaymentWalletWebViewScreen extends StatelessWidget {
  const PaymentWalletWebViewScreen({super.key});

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
        body: BlocBuilder<WalletPaymentCubit, WalletPaymentState>(
          builder: (context, state) {
            if (state is WalletPaymentLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WalletPaymentFailure) {
              return Center(
                child: CenterHintMsg(
                    msg: AppLocalizations.of(context)!
                        .translate('fourthStepPaymetFail')!),
              );
            } else if (state is WalletPaymentLoaded) {
              return InAppWebView(
                initialUrlRequest:
                    URLRequest(url: Uri.parse(state.paymentWalletUrl)),
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
