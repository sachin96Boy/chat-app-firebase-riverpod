import 'package:chat_app_firebase/widgets/body/appbar/customappbar.dart';
import 'package:chat_app_firebase/widgets/body/bottom-naigation/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
