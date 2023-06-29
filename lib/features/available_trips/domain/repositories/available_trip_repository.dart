import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/available_trip_entity.dart';
import '../entities/trip_search_entity.dart';

abstract class AvailableTripsRepository {
  Future<Either<Failure, List<AvailableTripEntity>>> getAvailableTrips(
      TripSearchEntity tripSearchEntity);
}
