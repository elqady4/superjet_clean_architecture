import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/features/available_trips/domain/entities/available_seats_entity.dart';

abstract class AvailableSeatsRepository {
  Future<Either<Failure, AvailableSeatsEntity>> getAvailableSeats(int tripID);
}
