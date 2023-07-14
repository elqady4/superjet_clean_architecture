import 'package:dio/dio.dart';
import 'package:suberjet_clean_architecture/api/payment_endpoints.dart';

import '../models/payment_info_model.dart';

abstract class GetOrderIdRemoteDataSource {
  Future<String> getOrderId(PaymentInfoModel paymentInfoModel);
}

class GetOrderIdRemoteDataSourceDIO extends GetOrderIdRemoteDataSource {
  @override
  Future<String> getOrderId(PaymentInfoModel paymentInfoModel) async {
    var respones = await Dio().post(PaymentEndPoints.ordersEndpoint, data: {
      "auth_token": paymentInfoModel.authToken,
      "delivery_needed": "false",
      "amount_cents": paymentInfoModel.amountCents,
      "currency": "EGP",
      "items": []
    });
    return respones.data['id'].toString();
  }
}
