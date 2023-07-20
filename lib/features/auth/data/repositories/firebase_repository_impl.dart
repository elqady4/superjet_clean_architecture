import 'package:dartz/dartz.dart';

import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/network/netwok_info.dart';
import 'package:suberjet_clean_architecture/features/auth/data/datasources/firebase_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/auth/data/models/user_model.dart';

import 'package:suberjet_clean_architecture/features/auth/domain/entities/user_entity.dart';

import '../../../../core/errors/exception.dart';
import '../../domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;
  final NetworkInfo networkInfo;

  FirebaseRepositoryImpl(
      {required this.firebaseRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, String>> getCurrentUId() async {
    if (await networkInfo.isConnected) {
      try {
        var result = await firebaseRemoteDataSource.getCurrentUId();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isSignIn() async {
    if (await networkInfo.isConnected) {
      try {
        var result = await firebaseRemoteDataSource.isSignIn();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signIn(UserEntity userEntity) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = UserModel(
            uid: userEntity.uid,
            name: userEntity.name,
            email: userEntity.email,
            phone: userEntity.phone,
            password: userEntity.password);
        await firebaseRemoteDataSource.signIn(userModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    if (await networkInfo.isConnected) {
      try {
        await firebaseRemoteDataSource.signOut();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp(UserEntity userEntity) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = UserModel(
            uid: userEntity.uid,
            name: userEntity.name,
            email: userEntity.email,
            phone: userEntity.phone,
            password: userEntity.password);
        await firebaseRemoteDataSource.signUp(userModel);
        return const Right(unit);
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.toString()));
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> getCreateCurrentUser(
      UserEntity userEntity) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = UserModel(
            uid: userEntity.uid,
            name: userEntity.name,
            email: userEntity.email,
            phone: userEntity.phone);
        await firebaseRemoteDataSource.getCreateCurrentUser(userModel);
        return const Right(unit);
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.toString()));
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    if (await networkInfo.isConnected) {
      try {
        UserModel user = await firebaseRemoteDataSource.getCurrentUser();

        return Right(
          UserEntity(
            email: user.email,
            name: user.name,
            phone: user.phone,
            uid: user.uid,
          ),
        );
      } on ServerException catch (e) {
        return Left(ServerFailure(msg: e.toString()));
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
