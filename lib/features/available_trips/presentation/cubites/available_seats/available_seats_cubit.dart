import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/features/available_trips/domain/usecases/get_available_seats_usecase.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/available_seats_entity.dart';

part 'available_seats_state.dart';

class AvailableSeatsCubit extends Cubit<AvailableSeatsState> {
  final GetAvailableSeatsUsecase getAvailableSeatsUsecase;

  int tripId = 0;
  String company = '';
  String travelTime = '';
  String busType = '';

  AvailableSeatsCubit({required this.getAvailableSeatsUsecase})
      : super(AvailableSeatsInitial());

  void getAvailableSeats(int tripID, BuildContext context) async {
    emit(AvailableSeatsLoading());
    Either<Failure, AvailableSeatsEntity> result =
        await getAvailableSeatsUsecase(tripID);
    result.fold(
        (failure) => emit(AvailableSeatsFailure(
            msg: AppLocalizations.of(context)!.translate('unexpectedError')!)),
        (availableSeatsEntity) => emit(
            AvailableSeatsLoaded(availableSeatsEntity: availableSeatsEntity)));
  }

  void selectedTripDetails({
    required int mTripId,
    required String mCompany,
    required String mTravelTime,
    required String mBusType,
  }) {
    tripId = mTripId;
    company = mCompany;
    travelTime = mTravelTime;
    busType = mBusType;
  }
}
