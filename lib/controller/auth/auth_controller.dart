// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app_firebase/providers/firebase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chat_app_firebase/controller/auth/auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  final Ref ref;

  AuthController({
    required this.ref,
  }) : super(const AuthStateInitial());

  void login(String email, String password) async {
    state = const AuthStateLoading();

    try {
      await ref
          .read(firebaseAuthServiceProvider)
          .signInWithEmailandPassword(email, password);
      state = const AuthStateSuccess();
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }

  void signOut() async {
    await ref.read(firebaseAuthServiceProvider).signOutUser();
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
    (ref) => AuthController(ref: ref));
