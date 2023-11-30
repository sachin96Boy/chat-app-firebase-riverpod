import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat-user';

  final String receiverUsername;
  final String receiverUserEmail;
  final String receiverUserId;

  const ChatScreen(
      {super.key,
      required this.receiverUsername,
      required this.receiverUserEmail,
      required this.receiverUserId});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
