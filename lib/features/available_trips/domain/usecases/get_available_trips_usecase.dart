import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/available_trip_entity.dart';
import '../entities/trip_search_entity.dart';
import '../repositories/available_trip_repository.dart';

class GetAvailableTripsUsecas
    implements Usecase<List<AvailableTripEntity>, TripSearchEntity> {
  final AvailableTripsRepository availableTripsRepository;

  GetAvailableTripsUsecas({required this.availableTripsRepository});
  @override
  Future<Either<Failure, List<AvailableTripEntity>>> call(
      TripSearchEntity params) {
    return availableTripsRepository.getAvailableTrips(params);
  }
}
