import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/usecases/usecase.dart';
import 'package:suberjet_clean_architecture/features/available_trips/domain/entities/available_seats_entity.dart';
import 'package:suberjet_clean_architecture/features/available_trips/domain/repositories/available_seats_repository.dart';

class GetAvailableSeatsUsecase extends Usecase<AvailableSeatsEntity, int> {
  final AvailableSeatsRepository availableSeatsRepository;

  GetAvailableSeatsUsecase({required this.availableSeatsRepository});

  @override
  Future<Either<Failure, AvailableSeatsEntity>> call(int params) {
    return availableSeatsRepository.getAvailableSeats(params);
  }
}
