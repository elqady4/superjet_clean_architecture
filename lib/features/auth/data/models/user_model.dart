import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.uid,
      required super.name,
      required super.email,
      required super.phone,
      super.password});

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      name: documentSnapshot.get('name'),
      uid: documentSnapshot.get('uid'),
      email: documentSnapshot.get('email'),
      phone: documentSnapshot.get('phone'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "phone": phone,
    };
  }
}
