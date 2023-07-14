import 'package:dio/dio.dart';
import 'package:suberjet_clean_architecture/api/payment_endpoints.dart';

abstract class GetFirstTokenRemoteDataSource {
  Future<String> getFirstToken(String apiKey);
}

class GetFirstTokenRemoteDataSourceDIO extends GetFirstTokenRemoteDataSource {
  @override
  Future<String> getFirstToken(String apiKey) async {
    var respones = await Dio().post(PaymentEndPoints.authEndpoint,
        data: {"api_key": PaymentEndPoints.apiKey});
    return respones.data['token'];
  }
}
