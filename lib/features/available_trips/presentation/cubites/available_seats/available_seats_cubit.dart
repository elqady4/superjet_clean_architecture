import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';
import 'package:suberjet_clean_architecture/features/available_trips/domain/usecases/get_available_seats_usecase.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/available_seats_entity.dart';

part 'available_seats_state.dart';

class AvailableSeatsCubit extends Cubit<AvailableSeatsState> {
  final GetAvailableSeatsUsecase getAvailableSeatsUsecase;
  AvailableSeatsCubit({required this.getAvailableSeatsUsecase})
      : super(AvailableSeatsInitial());

  void getAvailableSeats(int tripID) async {
    emit(AvailableSeatsLoading());
    Either<Failure, AvailableSeatsEntity> result =
        await getAvailableSeatsUsecase(tripID);
    result.fold(
        (failure) =>
            emit(const AvailableSeatsFailure(msg: AppStrings.unexpectedError)),
        (availableSeatsEntity) => emit(
            AvailableSeatsLoaded(availableSeatsEntity: availableSeatsEntity)));
  }
}
