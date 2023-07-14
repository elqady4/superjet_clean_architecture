import '../../domain/entities/payment_info_entity.dart';

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
