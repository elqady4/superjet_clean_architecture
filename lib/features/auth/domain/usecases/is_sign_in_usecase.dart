import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/usecases/usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/repositories/firebase_repository.dart';

class IsSignInUsecase extends Usecase<bool, Unit> {
  final FirebaseRepository firebaseRepository;

  IsSignInUsecase({required this.firebaseRepository});
  @override
  Future<Either<Failure, bool>> call(Unit params) {
    return firebaseRepository.isSignIn();
  }
}
