import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/routes/routes.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';
import 'package:suberjet_clean_architecture/core/widgets/center_msg.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubit/card_payment_cubit/cubit/card_payment_cubit.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubit/payment_method_cubit/payment_method_cubit.dart';

class ChoosePaymentMethodScreen extends StatelessWidget {
  const ChoosePaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
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
          return const Center(
            child: CenterHintMsg(msg: AppStrings.secondStepPaymetFail),
          );
        } else if (state is PaymentMethodLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  //BlocProvider.of<HomeCubit>(context).getPaymentKeyCard();
                  Navigator.pushNamed(context, Routes.paymentWebviewRoute);
                  BlocProvider.of<CardPaymentCubit>(context)
                      .getPaymentKeyCard(state.paymentInfoEntity);
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(255, 220, 218, 218)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/visa_master.png',
                        width: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Pay With Card',
                        style: TextStyle(fontSize: 28),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //BlocProvider.of<HomeCubit>(context).getPaymentKeyWallet();
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(255, 220, 218, 218)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/voda_cash.png',
                        width: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Pay With VodaFone Cash',
                        style: TextStyle(fontSize: 28),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        } else {
          return const Center(
            child: CenterHintMsg(msg: AppStrings.unexpectedError),
          );
        }
      },
    );
  }
}
