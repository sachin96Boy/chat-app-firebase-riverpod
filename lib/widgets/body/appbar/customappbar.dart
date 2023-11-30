import 'package:chat_app_firebase/controller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      actions: [
        PopupMenuButton(
          position: PopupMenuPosition.under,
          itemBuilder: (context) => [
            PopupMenuItem(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Signout',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                ref.read(authControllerProvider.notifier).signOut();
                Navigator.of(context).pop();
              },
            ))
          ],
          child: const CircleAvatar(
            child: Icon(
              Icons.person,
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
