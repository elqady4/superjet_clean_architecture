import 'package:dartz/dartz.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/netwok_info.dart';
import '../../domain/entities/available_trip_entity.dart';
import '../../domain/entities/trip_search_entity.dart';
import '../../domain/repositories/available_trip_repository.dart';
import '../datasources/available_trips_remote_data_source.dart';
import '../models/trip_search_model.dart';

class AvailableTripsRepositoryImpl implements AvailableTripsRepository {
  final NetworkInfo networkInfo;
  final AvailableTripsRemoteDataSource availableTripsRemoteDataSource;

  AvailableTripsRepositoryImpl(
      {required this.networkInfo,
      required this.availableTripsRemoteDataSource});
  @override
  Future<Either<Failure, List<AvailableTripEntity>>> getAvailableTrips(
      TripSearchEntity tripSearchEntity) async {
    if (await networkInfo.isConnected) {
      try {
        var result = await availableTripsRemoteDataSource.getAvailableTrips(
            TripSearchModel(
                destinationCity: tripSearchEntity.destinationCity,
                arrivalCity: tripSearchEntity.arrivalCity,
                travelDate: tripSearchEntity.travelDate));
        return right(result);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
