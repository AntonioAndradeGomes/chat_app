import 'package:chat_app/pages/profile/widgets/user_info.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit_rounded,
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            UserInfo(),
          ],
        ),
      ),
    );
  }
}
