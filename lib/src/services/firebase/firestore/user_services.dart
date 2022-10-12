import 'package:intellibra/src/models/user_model.dart';
import 'package:intellibra/src/riverpods/auth_riverpods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserServices {
  final Reader _read;
  UserServices(this._read);
  final _firestore = FirebaseFirestore.instance;

  Future<bool> createUser(UserModel data) async {
    final uid = _read(AuthRiverpods.firebaseAuthProvider).currentUser!.uid;
    try {
      await _firestore.collection('users').doc(uid).set(
            data
                .copyWith(uid: _read(AuthRiverpods.currentUserRiverpod)?.uid)
                .toMap(),
          );
      return true;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<bool> updateUser(UserModel data) async {
    final uid = _read(AuthRiverpods.firebaseAuthProvider).currentUser!.uid;
    try {
      await _firestore.collection('users').doc(uid).update(data.toMap());
      return true;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<UserModel> getUser() async {
    final uid = _read(AuthRiverpods.firebaseAuthProvider).currentUser!.uid;
    try {
      final user = await _firestore.collection('users').doc(uid).get();
      return UserModel.fromMap(user.data()!);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<bool> deleteUser() async {
    final uid = _read(AuthRiverpods.firebaseAuthProvider).currentUser!.uid;
    try {
      await _firestore.collection('users').doc(uid).delete();
      return true;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
