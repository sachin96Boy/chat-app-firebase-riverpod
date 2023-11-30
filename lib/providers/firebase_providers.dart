import 'package:chat_app_firebase/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthServiceProvider = Provider.autoDispose<AuthService>(
    (ref) => AuthService(FirebaseAuth.instance));

final firebaseAuthStateProvider = StreamProvider.autoDispose<User?>(
    (ref) => ref.read(firebaseAuthServiceProvider).authStateChange);

final firebaseFirestoreProvider = FutureProvider.autoDispose<FirebaseFirestore>(
    (ref) => FirebaseFirestore.instance);
