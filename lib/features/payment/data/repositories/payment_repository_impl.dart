import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/exception.dart';

import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/network/netwok_info.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_first_token_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_order_id_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_payment_key_card_remote_data_source.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_payment_key_wallet_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_wallet_url_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/reverse_seats_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/models/payment_info_model.dart';
import 'package:suberjet_clean_architecture/features/payment/data/models/reverse_seats_model.dart';

import 'package:suberjet_clean_architecture/features/payment/domain/entities/payment_info_entity.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/entities/reverse_seats_entity.dart';

import '../../domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  final GetFirstTokenRemoteDataSource getFirstTokenRemoteDataSource;
  final GetOrderIdRemoteDataSource getOrderIdRemoteDataSource;
  final GetPaymentKeyCardRemoteDataSource getPaymentKeyCardRemoteDataSource;
  final GetPaymentKeyWalletRemoteDataSource getPaymentKeyWalletRemoteDataSource;
  final GetWalletUrlRemoteDataSource getWalletUrlRemoteDataSource;
  final ReverseSeatsRemoteDataSource reverseSeatsRemoteDataSource;
  final NetworkInfo networkInfo;

  PaymentRepositoryImpl(
      {required this.getFirstTokenRemoteDataSource,
      required this.getOrderIdRemoteDataSource,
      required this.getPaymentKeyCardRemoteDataSource,
      required this.getPaymentKeyWalletRemoteDataSource,
      required this.getWalletUrlRemoteDataSource,
      required this.reverseSeatsRemoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, String>> getFirstToken(String apiKey) async {
    if (await networkInfo.isConnected) {
      try {
        var result = await getFirstTokenRemoteDataSource.getFirstToken(apiKey);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getOrderID(
      PaymentInfoEntity paymentInfoEntity) async {
    if (await networkInfo.isConnected) {
      try {
        PaymentInfoModel paymentInfoModel = PaymentInfoModel(
            authToken: paymentInfoEntity.authToken,
            amountCents: paymentInfoEntity.amountCents,
            orderID: paymentInfoEntity.orderID,
            email: paymentInfoEntity.email,
            firstName: paymentInfoEntity.firstName,
            lastName: paymentInfoEntity.lastName,
            phoneNumber: paymentInfoEntity.phoneNumber);
        var result =
            await getOrderIdRemoteDataSource.getOrderId(paymentInfoModel);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getPaymentKeyCard(
      PaymentInfoEntity paymentInfoEntity) async {
    if (await networkInfo.isConnected) {
      try {
        PaymentInfoModel paymentInfoModel = PaymentInfoModel(
            authToken: paymentInfoEntity.authToken,
            amountCents: paymentInfoEntity.amountCents,
            orderID: paymentInfoEntity.orderID,
            email: paymentInfoEntity.email,
            firstName: paymentInfoEntity.firstName,
            lastName: paymentInfoEntity.lastName,
            phoneNumber: paymentInfoEntity.phoneNumber);
        var result = await getPaymentKeyCardRemoteDataSource
            .getPaymentKeyCard(paymentInfoModel);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getPaymentKeyWallet(
      PaymentInfoEntity paymentInfoEntity) async {
    if (await networkInfo.isConnected) {
      try {
        PaymentInfoModel paymentInfoModel = PaymentInfoModel(
            authToken: paymentInfoEntity.authToken,
            amountCents: paymentInfoEntity.amountCents,
            orderID: paymentInfoEntity.orderID,
            email: paymentInfoEntity.email,
            firstName: paymentInfoEntity.firstName,
            lastName: paymentInfoEntity.lastName,
            phoneNumber: paymentInfoEntity.phoneNumber);
        var result = await getPaymentKeyWalletRemoteDataSource
            .getPaymentKeyWallet(paymentInfoModel);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getWalletURL(String paymentKey) async {
    if (await networkInfo.isConnected) {
      try {
        var result =
            await getWalletUrlRemoteDataSource.getWalletUrl(paymentKey);
        return Right(result);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> reverseSeats(
      ReverseSeatsEntity reverseSeatsEntity) async {
    if (await networkInfo.isConnected) {
      try {
        ReverseSeatsModel reverseSeatsModel = ReverseSeatsModel(
            tripId: reverseSeatsEntity.tripId,
            orderId: reverseSeatsEntity.orderId,
            companyName: reverseSeatsEntity.companyName,
            cityFrom: reverseSeatsEntity.cityFrom,
            cityTo: reverseSeatsEntity.cityTo,
            travelDate: reverseSeatsEntity.travelDate,
            travelTime: reverseSeatsEntity.travelTime,
            busType: reverseSeatsEntity.busType,
            seats: reverseSeatsEntity.seats);
        var result =
            await reverseSeatsRemoteDataSource.reverseSeats(reverseSeatsModel);
        return Right(result);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
