import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  User? get user => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> login(
      String email,
      String password,
      ) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  Future<UserCredential> signup(
      String email,
      String password,
      ) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  Future<UserCredential?> googleLogin() async {
    try {
      if (kIsWeb) {
        return await _auth.signInWithPopup(
          GoogleAuthProvider(),
        );
      }

      await _googleSignIn.initialize();

      final googleUser = await _googleSignIn.authenticate();

      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      debugPrint('Google Sign-In Error: $e');
      return null;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();

    if (!kIsWeb) {
      await _googleSignIn.signOut();
    }
  }
}