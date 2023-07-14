import 'package:equatable/equatable.dart';

class PaymentInfoEntity extends Equatable {
  String? authToken;
  final double amountCents;
  String? orderID;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  PaymentInfoEntity(
      {this.authToken,
      required this.amountCents,
      this.orderID,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber});
  @override
  List<Object?> get props => [
        authToken,
        amountCents,
        orderID,
        email,
        firstName,
        lastName,
        phoneNumber
      ];
}
