import 'package:dio/dio.dart';

import '../../../../api/end_points.dart';
import '../models/available_trip_model.dart';
import '../models/trip_search_model.dart';

abstract class AvailableTripsRemoteDataSource {
  Future<List<AvailableTripModel>> getAvailableTrips(
      TripSearchModel tripSearchModel);
}

class AvailableTripsRemoteDataSourceDIO extends AvailableTripsRemoteDataSource {
  @override
  Future<List<AvailableTripModel>> getAvailableTrips(
      TripSearchModel tripSearchModel) async {
    var response = await Dio().get(EndPoints.tripsEndpoint);
    return List<AvailableTripModel>.from((response.data as List)
        .map((trip) => AvailableTripModel.fromJson(trip)));
  }
}
