part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserEntity userEntity;

  const UserSuccess({required this.userEntity});
}

class UserFailure extends UserState {
  final String msg;

  const UserFailure({required this.msg});
}
