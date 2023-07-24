import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/entities/reverse_seats_entity.dart';

import '../entities/payment_info_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, String>> getFirstToken(String apiKey);
  Future<Either<Failure, String>> getOrderID(
      PaymentInfoEntity paymentInfoEntity);
  Future<Either<Failure, String>> getPaymentKeyCard(
      PaymentInfoEntity paymentInfoEntity);
  Future<Either<Failure, String>> getPaymentKeyWallet(
      PaymentInfoEntity paymentInfoEntity);
  Future<Either<Failure, String>> getWalletURL(String paymentKey);
  Future<Either<Failure, void>> reverseSeats(
      ReverseSeatsEntity reverseSeatsEntity);
}
