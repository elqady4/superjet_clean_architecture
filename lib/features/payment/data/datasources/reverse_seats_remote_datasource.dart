import 'package:dio/dio.dart';
import 'package:suberjet_clean_architecture/api/end_points.dart';
import 'package:suberjet_clean_architecture/features/payment/data/models/reverse_seats_model.dart';

abstract class ReverseSeatsRemoteDataSource {
  Future<void> reverseSeats(ReverseSeatsModel reverseSeatsModel);
}

class ReverseSeatsRemoteDataSourceDIO implements ReverseSeatsRemoteDataSource {
  @override
  Future<void> reverseSeats(ReverseSeatsModel reverseSeatsModel) async {
    var result = await Dio().post(
      EndPoints.reverseSeats,
      data: {
        "trip_id": reverseSeatsModel.tripId,
        "order_id": reverseSeatsModel.orderId,
        "company": reverseSeatsModel.companyName,
        "cityfrom": reverseSeatsModel.cityFrom,
        "cityto": reverseSeatsModel.cityTo,
        "travel_date": reverseSeatsModel.travelDate,
        "travel_time": reverseSeatsModel.travelTime,
        "bus_type": reverseSeatsModel.busType,
        "array_seats": reverseSeatsModel.seats.toString(),
      },
    );
  }
}
