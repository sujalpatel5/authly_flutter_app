import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthController {
  final auth = FirebaseAuth.instance;

  UserModel? get user {
    final u = auth.currentUser;
    return u?.email == null ? null : UserModel(email: u!.email!);
  }

  Future<void> signup(String e, String p) =>
      auth.createUserWithEmailAndPassword(email: e, password: p);

  Future<void> login(String e, String p) =>
      auth.signInWithEmailAndPassword(email: e, password: p);

  Future<void> logout() => auth.signOut();
}