import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  Future<Either<Failure, bool>> isSignIn();
  Future<Either<Failure, Unit>> signIn(UserEntity userEntity);
  Future<Either<Failure, Unit>> signUp(UserEntity userEntity);
  Future<Either<Failure, Unit>> getCreateCurrentUser(UserEntity userEntity);
  Future<Either<Failure, Unit>> signOut();
  Future<Either<Failure, String>> getCurrentUId();
}
