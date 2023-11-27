import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: size.height * 0.2,
      alignment: Alignment.center,
      child: Image.asset(
        'assets/icons/chat-we-logo.png',
        alignment: Alignment.center,
        fit: BoxFit.fill,
        color: Colors.white,
      ),
    );
  }
}
