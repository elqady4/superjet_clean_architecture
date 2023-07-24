import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/entities/reverse_seats_entity.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/reverse_seats_usecase.dart';

import '../../../../../core/errors/failure.dart';

part 'reverse_seats_state.dart';

class ReverseSeatsCubit extends Cubit<ReverseSeatsState> {
  final ReverseSeatsUsecase reverseSeatsUsecase;
  ReverseSeatsCubit({required this.reverseSeatsUsecase})
      : super(ReverseSeatsInitial());

  Future<void> reverseSeats(
      {required ReverseSeatsEntity reverseSeatsEntity,
      required BuildContext context}) async {
    Either<Failure, void> result =
        await reverseSeatsUsecase(reverseSeatsEntity);
    result.fold(
        (failure) => emit(ReverseSeatsFail(
            msg: AppLocalizations.of(context)!
                .translate('secondStepPaymetFail')!)),
        (r) => emit(ReverseSeatsSuccess()));
  }
}
