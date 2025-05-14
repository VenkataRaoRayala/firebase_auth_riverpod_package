import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_auth_callbacks.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

  Future<void> signInWithEmail({
    required String email,
    required String password,
    required AuthSuccessCallback onSuccess,
    required AuthFailureCallback onFailure,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess(result.user!);
    } on FirebaseAuthException catch (e) {
      onFailure(e.message ?? 'Unknown error');
    }
  }

  Future<void> registerWithEmail({
    required String email,
    required String password,
    required AuthSuccessCallback onSuccess,
    required AuthFailureCallback onFailure,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess(result.user!);
    } on FirebaseAuthException catch (e) {
      onFailure(e.message ?? 'Unknown error');
    }
  }

  Future<void> signOut() => _auth.signOut();

  Stream<User?> get authState => _auth.authStateChanges();
}
