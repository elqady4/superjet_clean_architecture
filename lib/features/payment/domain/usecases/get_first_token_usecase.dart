import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/usecases/usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/repositories/payment_repository.dart';

class GetFirstTokenUsecase extends Usecase<String, String> {
  final PaymentRepository paymentRepository;

  GetFirstTokenUsecase({required this.paymentRepository});
  @override
  Future<Either<Failure, String>> call(String params) {
    return paymentRepository.getFirstToken(params);
  }
}
