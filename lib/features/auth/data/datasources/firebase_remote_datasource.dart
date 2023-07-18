import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:suberjet_clean_architecture/features/auth/data/models/user_model.dart';

abstract class FirebaseRemoteDataSource {
  Future<bool> isSignIn();
  Future<void> signIn(UserModel userModel);
  Future<void> signUp(UserModel userModel);
  Future<void> getCreateCurrentUser(UserModel userModel);
  Future<void> signOut();
  Future<String> getCurrentUId();
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseRemoteDataSourceImpl({required this.auth, required this.firestore});

  @override
  Future<void> getCreateCurrentUser(UserModel userModel) async {
    final userCollectionRef = firestore.collection("users");
    final userId = await getCurrentUId();
    userCollectionRef.doc(userId).get().then((value) {
      final newUser = UserModel(
        uid: userId,
        email: userModel.email,
        name: userModel.name,
        phone: userModel.phone,
      ).toDocument();
      if (!value.exists) {
        userCollectionRef.doc(userId).set(newUser);
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserModel userModel) async =>
      auth.signInWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);

  @override
  Future<void> signOut() async => auth.signOut();

  @override
  Future<void> signUp(UserModel userModel) async =>
      await auth.createUserWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
}
