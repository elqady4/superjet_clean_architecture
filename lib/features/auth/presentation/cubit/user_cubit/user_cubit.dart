import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/core/errors/exception.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/entities/user_entity.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/get_create_current_user_usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/sign_up_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;
  final GetCreateCurrentUserUsecase getCreateCurrentUserUsecase;
  UserCubit(
      {required this.signInUsecase,
      required this.signUpUsecase,
      required this.getCreateCurrentUserUsecase})
      : super(UserInitial());

  Future<void> submitSignIn({required UserEntity userEntity}) async {
    emit(UserLoading());
    try {
      await signInUsecase(userEntity);
      emit(UserSuccess(userEntity: userEntity));
    } on ServerException catch (_) {
      emit(const UserFailure(msg: AppStrings.signInServerError));
    } catch (_) {
      emit(const UserFailure(msg: AppStrings.signInError));
    }
  }

  Future<void> submitSingUp({required UserEntity userEntity}) async {
    emit(UserLoading());
    Either<Failure, Unit> result;
    result = await signUpUsecase(userEntity);
    result.fold(
        (failure) => emit(const UserFailure(msg: 'msg')), (unit) => null);
    result = await getCreateCurrentUserUsecase(userEntity);
    result.fold((failure) => emit(const UserFailure(msg: 'msg2')),
        (unit) => emit(UserSuccess(userEntity: userEntity)));
  }
}
