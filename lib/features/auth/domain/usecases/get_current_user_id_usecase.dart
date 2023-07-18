import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/usecases/usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/repositories/firebase_repository.dart';

class GetCurrentUserIdUsecase extends Usecase<String, Unit> {
  final FirebaseRepository firebaseRepository;

  GetCurrentUserIdUsecase({required this.firebaseRepository});

  @override
  Future<Either<Failure, String>> call(Unit params) {
    return firebaseRepository.getCurrentUId();
  }
}
