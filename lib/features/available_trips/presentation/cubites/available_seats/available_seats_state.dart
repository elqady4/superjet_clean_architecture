part of 'available_seats_cubit.dart';

abstract class AvailableSeatsState extends Equatable {
  const AvailableSeatsState();

  @override
  List<Object> get props => [];
}

class AvailableSeatsInitial extends AvailableSeatsState {}

class AvailableSeatsLoading extends AvailableSeatsState {}

class AvailableSeatsLoaded extends AvailableSeatsState {
  final AvailableSeatsEntity availableSeatsEntity;

  const AvailableSeatsLoaded({required this.availableSeatsEntity});
}

class AvailableSeatsFailure extends AvailableSeatsState {
  final String msg;

  const AvailableSeatsFailure({required this.msg});
}
