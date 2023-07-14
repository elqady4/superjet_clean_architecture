import 'package:suberjet_clean_architecture/features/available_trips/domain/entities/available_seats_entity.dart';

class AvailableSeatsModel extends AvailableSeatsEntity {
  const AvailableSeatsModel(
      {required super.tripID,
      required super.reservedSeats,
      required super.ticketPrice});

  factory AvailableSeatsModel.fromJson(Map<String, dynamic> json) =>
      AvailableSeatsModel(
        tripID: json["TripID"],
        reservedSeats: List<int>.from(json["ReservedSeats"].map((x) => x)),
        ticketPrice: double.parse(json["TicketPrice"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "TripID": tripID,
        "ReservedSeats": List<dynamic>.from(reservedSeats.map((x) => x)),
        "TicketPrice": ticketPrice,
      };
}
