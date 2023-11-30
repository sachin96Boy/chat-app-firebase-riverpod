import 'package:flutter/material.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime,
      child: const Center(
        child: Text('This is settings section'),
      ),
    );
  }
}
