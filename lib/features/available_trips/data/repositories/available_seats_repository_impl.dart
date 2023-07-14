import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/exception.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/network/netwok_info.dart';
import 'package:suberjet_clean_architecture/features/available_trips/data/datasources/available_seats_remote.dart';
import 'package:suberjet_clean_architecture/features/available_trips/domain/entities/available_seats_entity.dart';
import 'package:suberjet_clean_architecture/features/available_trips/domain/repositories/available_seats_repository.dart';

class AvailableSeatsRepositoryImpl extends AvailableSeatsRepository {
  final AvailableSeatsRemoteDataSource availableSeatsRemoteDataSource;
  final NetworkInfo networkInfo;

  AvailableSeatsRepositoryImpl(
      {required this.availableSeatsRemoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, AvailableSeatsEntity>> getAvailableSeats(
      int tripID) async {
    if (await networkInfo.isConnected) {
      try {
        var result =
            await availableSeatsRemoteDataSource.getAvailableSeats(tripID);
        return right(result);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
