import 'package:dio/dio.dart';
import 'package:suberjet_clean_architecture/api/payment_endpoints.dart';

abstract class GetWalletUrlRemoteDataSource {
  Future<String> getWalletUrl(String paymentKey);
}

class GetWalletUrlRemoteDataSourceDIO extends GetWalletUrlRemoteDataSource {
  @override
  Future<String> getWalletUrl(String paymentKey) async {
    var respones = await Dio().post(
      PaymentEndPoints.walletEndpoint,
      data: {
        "source": {"identifier": "01010101010", "subtype": "WALLET"},
        "payment_token": paymentKey
      },
      options: Options(headers: {
        'Content-Type': "application/json",
      }),
    );
    return respones.data['iframe_redirection_url'];
  }
}
