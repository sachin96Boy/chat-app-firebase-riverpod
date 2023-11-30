import 'package:chat_app_firebase/providers/firebase_providers.dart';
import 'package:chat_app_firebase/screens/get_started_screen.dart';
import 'package:chat_app_firebase/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Authgate extends ConsumerWidget {
  const Authgate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(firebaseAuthStateProvider);
    return authState.when(
      data: (user) {
        if (user != null) return const HomeScreen();
        return const GetStartedScreen();
      },
      error: (error, stackTrace) {
        return const GetStartedScreen();
      },
      loading: () {
        return const LodingBodyState();
      },
    );
  }
}

class LodingBodyState extends StatelessWidget {
  const LodingBodyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
