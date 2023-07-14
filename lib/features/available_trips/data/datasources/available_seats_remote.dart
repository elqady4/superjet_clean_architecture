import 'package:dio/dio.dart';
import 'package:suberjet_clean_architecture/api/end_points.dart';
import 'package:suberjet_clean_architecture/features/available_trips/data/models/available_seats_model.dart';

abstract class AvailableSeatsRemoteDataSource {
  Future<AvailableSeatsModel> getAvailableSeats(int tripID);
}

class AvailableSeatsRemoteDataSourceDIO extends AvailableSeatsRemoteDataSource {
  @override
  Future<AvailableSeatsModel> getAvailableSeats(int tripID) async {
    var response = await Dio().get(EndPoints.availableSeatsByIdEndpoint);
    return AvailableSeatsModel.fromJson(response.data);
  }
}
