part of 'available_trips_cubit.dart';

abstract class AvailableTripsState extends Equatable {
  const AvailableTripsState();

  @override
  List<Object> get props => [];
}

class AvailableTripsLoading extends AvailableTripsState {}

class AvailableTripsLoaded extends AvailableTripsState {
  final List<AvailableTripEntity> availableTripsList;

  const AvailableTripsLoaded({required this.availableTripsList});
}

class AvailableTripsFailure extends AvailableTripsState {
  final String msg;

  const AvailableTripsFailure({required this.msg});
}
