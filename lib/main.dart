import 'package:chat_app_firebase/screens/get_started_screen.dart';
import 'package:chat_app_firebase/screens/home_screen.dart';
import 'package:chat_app_firebase/screens/login_screen.dart';
import 'package:chat_app_firebase/screens/register_screen.dart';
// import 'package:chat_app_firebase/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat-app-Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
