import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
      title: const Text(
        'Home',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      primary: true,
      centerTitle: true,
      actions: const [
        CircleAvatar(
          child: Icon(
            Icons.person,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
