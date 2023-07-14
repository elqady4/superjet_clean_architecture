import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/api/payment_endpoints.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/entities/payment_info_entity.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_first_token_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_order_id_usecase.dart';

import '../../../../../core/errors/failure.dart';

part 'payment_method_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  final GetFirstTokenUsecase getFirstTokenUsecase;
  final GetOrderIdUsecase getOrderIdUsecase;
  PaymentMethodCubit(
      {required this.getFirstTokenUsecase, required this.getOrderIdUsecase})
      : super(PaymentMethodInitial());

  void getFirstToken(PaymentInfoEntity paymentInfoEntity) async {
    emit(PaymentMethodLoading());
    Either<Failure, String> result =
        await getFirstTokenUsecase(PaymentEndPoints.apiKey);
    result.fold(
        (failure) => emit(
            const PaymentMethodFailure(msg: AppStrings.firstStepPaymetFail)),
        (firstToken) {
      paymentInfoEntity.authToken = firstToken;
      getOrderId(paymentInfoEntity);
    });
  }

  void getOrderId(PaymentInfoEntity params) async {
    Either<Failure, String> result = await getOrderIdUsecase(params);
    result.fold(
        (failure) => emit(
            const PaymentMethodFailure(msg: AppStrings.secondStepPaymetFail)),
        (orderId) {
      params.orderID = orderId;
      emit(PaymentMethodLoaded(paymentInfoEntity: params));
    });
  }
}
