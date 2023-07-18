part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final bool? isSignIn;
  final String? userId;

  const Authenticated({this.isSignIn, this.userId});
}

class UnAuthenticated extends AuthState {
  final String? msg;

  const UnAuthenticated({this.msg});
}
