import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/usecases/usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/entities/user_entity.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUserUsecase extends Usecase<Unit, UserEntity> {
  final FirebaseRepository firebaseRepository;

  GetCreateCurrentUserUsecase({required this.firebaseRepository});
  @override
  Future<Either<Failure, Unit>> call(UserEntity params) async {
    return await firebaseRepository.getCreateCurrentUser(params);
  }
}
