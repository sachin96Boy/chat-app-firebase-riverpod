import 'package:flutter/material.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text('This is Message section'),
      ),
    );
  }
}
