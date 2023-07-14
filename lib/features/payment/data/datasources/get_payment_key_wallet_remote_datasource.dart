import 'package:dio/dio.dart';
import 'package:suberjet_clean_architecture/api/payment_endpoints.dart';
import 'package:suberjet_clean_architecture/features/payment/data/models/payment_info_model.dart';

abstract class GetPaymentKeyWalletRemoteDataSource {
  Future<String> getPaymentKeyWallet(PaymentInfoModel paymentInfoModel);
}

class GetPaymentKeyWalletRemoteDataSourceDIO
    extends GetPaymentKeyWalletRemoteDataSource {
  @override
  Future<String> getPaymentKeyWallet(PaymentInfoModel paymentInfoModel) async {
    var respones = await Dio().post(PaymentEndPoints.paymentEndpoint, data: {
      "auth_token": paymentInfoModel.authToken,
      "amount_cents": paymentInfoModel.amountCents,
      "expiration": 3600,
      "order_id": paymentInfoModel.orderID,
      "billing_data": {
        "apartment": "NA",
        "email": paymentInfoModel.email,
        "floor": "NA",
        "first_name": paymentInfoModel.firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": paymentInfoModel.phoneNumber,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": paymentInfoModel.lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": 3993711,
      "lock_order_when_paid": "false"
    });
    return respones.data['token'];
  }
}
