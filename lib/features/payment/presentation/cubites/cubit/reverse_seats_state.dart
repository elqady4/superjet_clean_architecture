part of 'reverse_seats_cubit.dart';

abstract class ReverseSeatsState extends Equatable {
  const ReverseSeatsState();

  @override
  List<Object> get props => [];
}

class ReverseSeatsInitial extends ReverseSeatsState {}

class ReverseSeatsLoading extends ReverseSeatsState {}

class ReverseSeatsSuccess extends ReverseSeatsState {}

class ReverseSeatsFail extends ReverseSeatsState {
  final String msg;

  const ReverseSeatsFail({required this.msg});
}
