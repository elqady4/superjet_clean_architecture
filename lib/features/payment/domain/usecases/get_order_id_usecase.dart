import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/usecases/usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/entities/payment_info_entity.dart';

import '../repositories/payment_repository.dart';

class GetOrderIdUsecase extends Usecase<String, PaymentInfoEntity> {
  final PaymentRepository paymentRepository;

  GetOrderIdUsecase({required this.paymentRepository});
  @override
  Future<Either<Failure, String>> call(PaymentInfoEntity params) {
    return paymentRepository.getOrderID(params);
  }
}
