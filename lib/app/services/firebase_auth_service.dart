import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  FirebaseAuthService() : super();

  static final provider = Provider(
    (ref) => FirebaseAuthService(),
  );

  final _firebaseAuth = FirebaseAuth.instance;
  final _signIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    try {
      final account = await _signIn.signIn();

      final authentication = await account?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: authentication?.accessToken,
        idToken: authentication?.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } on Exception catch (e) {
      if (kDebugMode) {
        print('signInWithGoogle() exception: $e');
      }

      rethrow;
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await _firebaseAuth.signOut();
      await _signIn.signOut();

      return true;
    } on Exception catch (e) {
      if (kDebugMode) {
        print('signOutFromGoogle() exception: $e');
      }

      return false;
    }
  }

  User? get getCurrentUser {
    return _firebaseAuth.currentUser;
  }

  bool get isSignedIn {
    return _firebaseAuth.currentUser != null;
  }
}
