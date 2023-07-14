import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/usecases/usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/entities/payment_info_entity.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/repositories/payment_repository.dart';

class GetPaymentKeyWalletUsecase extends Usecase<String, PaymentInfoEntity> {
  final PaymentRepository paymentRepository;

  GetPaymentKeyWalletUsecase({required this.paymentRepository});
  @override
  Future<Either<Failure, String>> call(PaymentInfoEntity params) {
    return paymentRepository.getPaymentKeyWallet(params);
  }
}
