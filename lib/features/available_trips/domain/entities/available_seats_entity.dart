import 'package:equatable/equatable.dart';

class AvailableSeatsEntity extends Equatable {
  final int tripID;
  final List<int> reservedSeats;
  final double ticketPrice;

  const AvailableSeatsEntity(
      {required this.tripID,
      required this.reservedSeats,
      required this.ticketPrice});

  @override
  List<Object?> get props => [tripID, reservedSeats, ticketPrice];
}
