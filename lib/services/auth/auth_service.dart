import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance of firebase auth
  final FirebaseAuth _firebaseAuth;

  // instance of firestore auth
  final FirebaseFirestore _firestore;

  AuthService(this._firebaseAuth, this._firestore);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

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

  Future<UserCredential> signupWithEmailandPassword(
      String name, String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = <String, dynamic>{
        'uid': userCredential.user?.uid,
        'firstName': name,
        'email': userCredential.user?.email,
      };

      await _firestore
          .collection('USER')
          .doc(userCredential.user?.uid)
          .set(user);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out method
  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }
}
