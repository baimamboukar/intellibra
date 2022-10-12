import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intellibra/src/extensions/autorouter.dart';
import 'package:intellibra/src/models/user_model.dart';
import 'package:intellibra/src/riverpods/auth_riverpods.dart';
import 'package:intellibra/src/riverpods/firestore_riverpods.dart';

class Authentication {
  final Reader _read;
  Authentication(this._read);
  final _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(BuildContext context,
      {required String phoneNumber,
      required Function(String, int?) codeSent}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential creds) async {
        final userCreds = await _auth.signInWithCredential(creds);
        if (userCreds.user != null) {
          // context.autorouter.replaceNamed('/home');
        }
        debugPrint('Verification completed: $creds');
      },
      timeout: const Duration(seconds: 60),
      verificationFailed: (exception) {
        debugPrint('Verification failed: $exception');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        //  _read(verificationIdRiverpod.state).state = verificationId;
      },
      codeSent: codeSent,
    );
  }

  Future<void> signInWithPhoneNumber(BuildContext context,
      {required UserModel data,
      required String verificationID,
      required String smsCode}) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationID,
      smsCode: smsCode,
    );
    debugPrint('Credential: $verificationID');

    UserCredential userCreds = await _read(AuthRiverpods.firebaseAuthProvider)
        .signInWithCredential(credential);
    if (userCreds.user != null) {
      final response = await _read(FirestoreRiverpods.userServicesRiverpods)
          .createUser(data);
      debugPrint('User created: $response');
      response
          ? context.autorouter.replaceNamed('/home')
          : context.autorouter.replaceNamed('/');
    }
    debugPrint('Signed in with phone number successfully');
  }
}
