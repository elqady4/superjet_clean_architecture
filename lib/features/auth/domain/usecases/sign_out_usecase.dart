import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/usecases/usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/repositories/firebase_repository.dart';

class SignOutUsecase extends Usecase<Unit, Unit> {
  final FirebaseRepository firebaseRepository;

  SignOutUsecase({required this.firebaseRepository});
  @override
  Future<Either<Failure, Unit>> call(Unit params) {
    return firebaseRepository.signOut();
  }
}
