import '../../domain/entities/trip_search_entity.dart';

class TripSearchModel extends TripSearchEntity {
  const TripSearchModel(
      {required super.destinationCity,
      required super.arrivalCity,
      required super.travelDate});
}
