import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/available_trip_entity.dart';
import '../../domain/entities/trip_search_entity.dart';
import '../../domain/usecases/get_available_trips_usecase.dart';

part 'available_trips_state.dart';

class AvailableTripsCubit extends Cubit<AvailableTripsState> {
  final GetAvailableTripsUsecas getAvailableTripsUsecas;
  AvailableTripsCubit({required this.getAvailableTripsUsecas})
      : super(AvailableTripsLoading());

  void getAvailableTrips(TripSearchEntity tripSearchEntity) async {
    emit(AvailableTripsLoading());
    Either<Failure, List<AvailableTripEntity>> result =
        await getAvailableTripsUsecas(tripSearchEntity);
    result.fold(
        (failure) =>
            emit(const AvailableTripsFailure(msg: AppStrings.notFound)),
        (tripsList) =>
            emit(AvailableTripsLoaded(availableTripsList: tripsList)));
  }
}
