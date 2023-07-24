import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/usecases/usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/entities/reverse_seats_entity.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/repositories/payment_repository.dart';

class ReverseSeatsUsecase extends Usecase<void, ReverseSeatsEntity> {
  final PaymentRepository paymentRepository;

  ReverseSeatsUsecase({required this.paymentRepository});
  @override
  Future<Either<Failure, void>> call(ReverseSeatsEntity params) {
    return paymentRepository.reverseSeats(params);
  }
}
