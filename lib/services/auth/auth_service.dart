import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance of firebase auth
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChange =>
      _firebaseAuth.authStateChanges();

  // sign in method
  Future<UserCredential> signInWithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      // signin
      UserCredential userCredentials = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredentials;
    } on FirebaseAuthException catch (e) {
      // catch errors related to firebase login
      throw Exception(e.code);
    }
  }

  // sign out method
  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }
}
