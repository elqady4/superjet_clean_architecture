part of 'user_data_cubit.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataLoaded extends UserDataState {
  final UserEntity userEntity;

  const UserDataLoaded({required this.userEntity});
}

class UserDataFailure extends UserDataState {
  final String? msg;

  const UserDataFailure({this.msg});
}
