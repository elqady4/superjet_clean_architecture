import 'package:equatable/equatable.dart';

class AvailableTripEntity extends Equatable {
  final int id;
  final String company;
  final double rate;
  final String from;
  final String to;
  final String tripClass;
  final String date;
  final String travelTime;
  final String arraiveTime;
  final String tripTakeTime;

  const AvailableTripEntity(
      {required this.id,
      required this.company,
      required this.rate,
      required this.from,
      required this.to,
      required this.tripClass,
      required this.date,
      required this.travelTime,
      required this.arraiveTime,
      required this.tripTakeTime});

  @override
  List<Object?> get props => [
        id,
        company,
        rate,
        from,
        to,
        tripClass,
        date,
        travelTime,
        arraiveTime,
        tripTakeTime
      ];
}
