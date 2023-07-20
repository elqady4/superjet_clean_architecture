import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/entities/user_entity.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/get_current_user_usecase.dart';

import '../../../../../core/errors/failure.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final GetCurrentUserUsecase getCurrentUserUsecase;
  UserDataCubit({required this.getCurrentUserUsecase})
      : super(UserDataInitial());

  Future<void> getCurrentUser({required BuildContext context}) async {
    emit(UserDataLoading());
    Either<Failure, UserEntity> result = await getCurrentUserUsecase.call(unit);
    result.fold(
        (failure) => UserDataFailure(
            msg: AppLocalizations.of(context)!.translate('faildGetUser')!),
        (userentity) => emit(UserDataLoaded(userEntity: userentity)));
  }

  void removeUserDataWithLogout() {
    emit(UserDataInitial());
  }
}
