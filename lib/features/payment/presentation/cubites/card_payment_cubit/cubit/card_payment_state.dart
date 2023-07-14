part of 'card_payment_cubit.dart';

abstract class CardPaymentState extends Equatable {
  const CardPaymentState();

  @override
  List<Object> get props => [];
}

class CardPaymentInitial extends CardPaymentState {}

class CardPaymentLoading extends CardPaymentState {}

class CardPaymentLoaded extends CardPaymentState {
  final String paymentKeyCard;

  const CardPaymentLoaded({required this.paymentKeyCard});
}

class CardPaymentFailure extends CardPaymentState {
  final String msg;

  const CardPaymentFailure({required this.msg});
}
