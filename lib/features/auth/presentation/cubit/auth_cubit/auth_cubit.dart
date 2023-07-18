import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/get_current_user_id_usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/is_sign_in_usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/sign_out_usecase.dart';

import '../../../../../core/errors/failure.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUsecase isSignInUsecase;
  final SignOutUsecase signOutUsecase;
  final GetCurrentUserIdUsecase getCurrentUserIdUsecase;

  AuthCubit(
      {required this.isSignInUsecase,
      required this.signOutUsecase,
      required this.getCurrentUserIdUsecase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    emit(AuthLoading());
    Either<Failure, bool> result = await isSignInUsecase(unit);
    result.fold(
        (failure) =>
            emit(const UnAuthenticated(msg: AppStrings.authenticatedFailure)),
        (isSignIn) => emit(Authenticated(isSignIn: isSignIn)));
  }

  Future<void> loggedIn() async {
    emit(AuthLoading());
    Either<Failure, String> result = await getCurrentUserIdUsecase(unit);
    result.fold(
        (failure) =>
            emit(const UnAuthenticated(msg: AppStrings.loggingInFailure)),
        (userId) => emit(Authenticated(userId: userId, isSignIn: true)));
  }

  Future<void> loggedOut() async {
    emit(AuthLoading());
    Either<Failure, Unit> result = await signOutUsecase(unit);
    result.fold(
        (falure) =>
            emit(const UnAuthenticated(msg: AppStrings.loggingOutFailure)),
        (r) => emit(const UnAuthenticated()));
  }

  void setIsSignIn(bool signIn) {
    emit(Authenticated(isSignIn: signIn));
  }
}
