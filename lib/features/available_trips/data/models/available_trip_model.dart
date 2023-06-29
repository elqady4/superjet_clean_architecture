import '../../domain/entities/available_trip_entity.dart';

class AvailableTripModel extends AvailableTripEntity {
  const AvailableTripModel(
      {required super.id,
      required super.company,
      required super.rate,
      required super.from,
      required super.to,
      required super.tripClass,
      required super.date,
      required super.travelTime,
      required super.arraiveTime,
      required super.tripTakeTime});

  factory AvailableTripModel.fromJson(Map<String, dynamic> json) =>
      AvailableTripModel(
        id: json["Id"],
        company: json["Company"],
        rate: json["Rate"]?.toDouble(),
        from: json["From"],
        to: json["To"],
        tripClass: json["Class"],
        date: json["Date"],
        travelTime: json["TravelTime"],
        arraiveTime: json["ArraiveTime"],
        tripTakeTime: json["TripTakeTime"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Company": company,
        "Rate": rate,
        "From": from,
        "To": to,
        "Class": tripClass,
        "Date": date,
        "TravelTime": travelTime,
        "ArraiveTime": arraiveTime,
        "TripTakeTime": tripTakeTime,
      };
}
