part of 'payment_method_cubit.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodLoaded extends PaymentMethodState {
  final PaymentInfoEntity paymentInfoEntity;

  const PaymentMethodLoaded({required this.paymentInfoEntity});
}

class PaymentMethodFailure extends PaymentMethodState {
  final String msg;

  const PaymentMethodFailure({required this.msg});
}
