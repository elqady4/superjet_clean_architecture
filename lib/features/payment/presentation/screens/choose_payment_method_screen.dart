import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/config/routes/routes.dart';
import 'package:suberjet_clean_architecture/core/style/app_colors.dart';
import 'package:suberjet_clean_architecture/core/style/style_constant.dart';
import 'package:suberjet_clean_architecture/core/widgets/center_msg.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubites/card_payment_cubit/cubit/card_payment_cubit.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubites/payment_method_cubit/payment_method_cubit.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubites/wallet_payment_cubit/cubit/wallet_payment_cubit.dart';

class ChoosePaymentMethodScreen extends StatelessWidget {
  const ChoosePaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('paymetTitle')!),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
      builder: (context, state) {
        if (state is PaymentMethodLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PaymentMethodFailure) {
          return Center(
            child: CenterHintMsg(
                msg: AppLocalizations.of(context)!
                    .translate('secondStepPaymetFail')!),
          );
        } else if (state is PaymentMethodLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.translate('paymetTitle')!,
                      style: StyleConst.title2,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.paymentCardWebviewRoute);
                    BlocProvider.of<CardPaymentCubit>(context)
                        .getPaymentKeyCard(state.paymentInfoEntity, context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.translate('payCard')!,
                    style: StyleConst.title3.copyWith(color: AppColors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.paymentWalletWebviewRoute);
                    BlocProvider.of<WalletPaymentCubit>(context)
                        .getPaymentKeyWallet(state.paymentInfoEntity, context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.translate('payWallet')!,
                    style: StyleConst.title3.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CenterHintMsg(
                msg: AppLocalizations.of(context)!
                    .translate('unexpectedError')!),
          );
        }
      },
    );
  }
}
