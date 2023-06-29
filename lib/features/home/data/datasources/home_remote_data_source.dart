import 'package:dio/dio.dart';

import '../../../../api/end_points.dart';
import '../models/city_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CityModel>> getCities();
}

class HomeRemoteDataSourceDIO extends HomeRemoteDataSource {
  @override
  Future<List<CityModel>> getCities() async {
    var response = await Dio().get(EndPoints.citiesEndpoint);
    return List<CityModel>.from(
        (response.data as List).map((city) => CityModel.fromJson(city)));
  }
}
