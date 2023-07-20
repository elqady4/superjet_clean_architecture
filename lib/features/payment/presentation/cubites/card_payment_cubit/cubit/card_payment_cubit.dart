import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/entities/payment_info_entity.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_payment_key_card_usecase.dart';

import '../../../../../../core/errors/failure.dart';

part 'card_payment_state.dart';

class CardPaymentCubit extends Cubit<CardPaymentState> {
  final GetPaymentKeyCardUsecase getPaymentKeyCardUsecase;
  CardPaymentCubit({required this.getPaymentKeyCardUsecase})
      : super(CardPaymentInitial());

  void getPaymentKeyCard(PaymentInfoEntity params, BuildContext context) async {
    emit(CardPaymentLoading());
    Either<Failure, String> result = await getPaymentKeyCardUsecase(params);
    result.fold(
        (failure) => emit(CardPaymentFailure(
            msg: AppLocalizations.of(context)!
                .translate('thirdStepPaymetFail')!)), (paymentKeyCard) {
      emit(CardPaymentLoaded(paymentKeyCard: paymentKeyCard));
    });
  }
}
