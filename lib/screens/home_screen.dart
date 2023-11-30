import 'package:chat_app_firebase/widgets/body/appbar/customappbar.dart';
import 'package:chat_app_firebase/widgets/body/bottom-naigation/custom_bottom_navigation_bar.dart';
import 'package:chat_app_firebase/widgets/body/calls/calls_body.dart';
import 'package:chat_app_firebase/widgets/body/contacts/contacts_body.dart';
import 'package:chat_app_firebase/widgets/body/messages/messages_body.dart';
import 'package:chat_app_firebase/widgets/body/settings/settings_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/dashboard';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final List _screenBody = const [
    MessagesBody(),
    CallsBody(),
    ContactsBody(),
    SettingsBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      bottomNavigationBar: CustomBottomNavigationBar(
        callback: (value) => setState(() {
          pageIndex = value;
        }),
      ),
      body: _screenBody[pageIndex],
    );
  }
}
