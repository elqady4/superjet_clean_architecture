part of 'wallet_payment_cubit.dart';

abstract class WalletPaymentState extends Equatable {
  const WalletPaymentState();

  @override
  List<Object> get props => [];
}

class WalletPaymentInitial extends WalletPaymentState {}

class WalletPaymentLoading extends WalletPaymentState {}

class WalletPaymentLoaded extends WalletPaymentState {
  final String paymentWalletUrl;

  const WalletPaymentLoaded({required this.paymentWalletUrl});
}

class WalletPaymentFailure extends WalletPaymentState {
  final String msg;

  const WalletPaymentFailure({required this.msg});
}
