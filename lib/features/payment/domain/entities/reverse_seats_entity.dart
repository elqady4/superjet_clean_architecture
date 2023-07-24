import 'package:equatable/equatable.dart';

class ReverseSeatsEntity extends Equatable {
  final int tripId;
  final int orderId;
  final String companyName;
  final String cityFrom;
  final String cityTo;
  final String travelDate;
  final String travelTime;
  final String busType;
  final List<int> seats;

  const ReverseSeatsEntity(
      {required this.tripId,
      required this.orderId,
      required this.companyName,
      required this.cityFrom,
      required this.cityTo,
      required this.travelDate,
      required this.travelTime,
      required this.busType,
      required this.seats});

  @override
  List<Object?> get props => [
        tripId,
        orderId,
        companyName,
        cityFrom,
        cityTo,
        travelDate,
        travelTime,
        busType,
        seats
      ];
}
