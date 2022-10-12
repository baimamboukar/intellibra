import 'package:intellibra/src/services/firebase/auth/phone_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRiverpods {
  static final authStateChangesProvider =
      StreamProvider.autoDispose<User?>((ref) {
    return FirebaseAuth.instance.authStateChanges();
  });
  static final firebaseAuthProvider =
      Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
  static final authenticationProvider =
      Provider((ref) => Authentication(ref.read));
  static final currentUserRiverpod =
      Provider<User?>((ref) => FirebaseAuth.instance.currentUser);
}
