import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/usecases/usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/entities/user_entity.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/repositories/firebase_repository.dart';

class GetCurrentUserUsecase extends Usecase<UserEntity, Unit> {
  final FirebaseRepository firebaseRepository;

  GetCurrentUserUsecase({required this.firebaseRepository});
  @override
  Future<Either<Failure, UserEntity>> call(Unit params) async {
    return await firebaseRepository.getCurrentUser();
  }
}
