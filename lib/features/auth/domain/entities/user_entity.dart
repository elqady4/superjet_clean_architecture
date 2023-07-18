import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;

  const UserEntity(
      {this.uid, this.name, this.email, this.phone, this.password});

  @override
  List<Object?> get props => [uid, name, email, phone, password];
}
