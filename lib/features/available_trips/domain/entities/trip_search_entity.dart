import 'package:equatable/equatable.dart';

class TripSearchEntity extends Equatable {
  final String destinationCity;
  final String arrivalCity;
  final String travelDate;

  const TripSearchEntity(
      {required this.destinationCity,
      required this.arrivalCity,
      required this.travelDate});

  @override
  List<Object?> get props => [];
}
