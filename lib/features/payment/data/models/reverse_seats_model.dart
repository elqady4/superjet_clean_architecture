import 'package:suberjet_clean_architecture/features/payment/domain/entities/reverse_seats_entity.dart';

class ReverseSeatsModel extends ReverseSeatsEntity {
  const ReverseSeatsModel(
      {required super.tripId,
      required super.orderId,
      required super.companyName,
      required super.cityFrom,
      required super.cityTo,
      required super.travelDate,
      required super.travelTime,
      required super.busType,
      required super.seats});
}
