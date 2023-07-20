import '../../domain/entities/payment_info_entity.dart';

// ignore: must_be_immutable
class PaymentInfoModel extends PaymentInfoEntity {
  PaymentInfoModel(
      {super.authToken,
      required super.amountCents,
      super.orderID,
      required super.email,
      required super.firstName,
      required super.lastName,
      required super.phoneNumber});
}
