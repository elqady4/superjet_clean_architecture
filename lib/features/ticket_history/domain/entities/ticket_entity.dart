import 'package:equatable/equatable.dart';

class TicketEntity extends Equatable {
  final String orderId;
  final String tripId;
  final String payMethod;
  final String amount;
  final String payState;
  final String company;
  final String cityfrom;
  final String cityto;
  final String travelDate;
  final String travelTime;
  final String busType;
  final String arraySeats;

  const TicketEntity({
    required this.orderId,
    required this.tripId,
    required this.payMethod,
    required this.amount,
    required this.payState,
    required this.company,
    required this.cityfrom,
    required this.cityto,
    required this.travelDate,
    required this.travelTime,
    required this.busType,
    required this.arraySeats,
  });

  @override
  List<Object?> get props => [
        tripId,
        payMethod,
        amount,
        payState,
        company,
        cityfrom,
        cityto,
        travelDate,
        travelTime,
        busType,
        arraySeats
      ];
}
