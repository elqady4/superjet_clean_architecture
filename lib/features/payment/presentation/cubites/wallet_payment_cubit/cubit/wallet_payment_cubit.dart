import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_payment_key_wallet_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_wallet_url_usecase.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../domain/entities/payment_info_entity.dart';

part 'wallet_payment_state.dart';

class WalletPaymentCubit extends Cubit<WalletPaymentState> {
  final GetPaymentKeyWalletUsecase getPaymentKeyWalletUsecase;
  final GetWalletUrlUsecase getWalletUrlUsecase;
  WalletPaymentCubit(
      {required this.getPaymentKeyWalletUsecase,
      required this.getWalletUrlUsecase})
      : super(WalletPaymentInitial());

  void getPaymentKeyWallet(PaymentInfoEntity params) async {
    emit(WalletPaymentLoading());
    Either<Failure, String> result = await getPaymentKeyWalletUsecase(params);
    result.fold(
        (failure) => emit(
            const WalletPaymentFailure(msg: AppStrings.thirdStepPaymetFail)),
        (walletKey) => getWalletUrl(walletKey));
  }

  void getWalletUrl(String walletKey) async {
    Either<Failure, String> result = await getWalletUrlUsecase.call(walletKey);
    result.fold(
        (failure) => emit(
            const WalletPaymentFailure(msg: AppStrings.fourthStepPaymetFail)),
        (walletUrl) => emit(WalletPaymentLoaded(paymentWalletUrl: walletUrl)));
  }
}
