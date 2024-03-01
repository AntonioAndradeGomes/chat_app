import 'package:chat_app/config/routes/routes.dart';
import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/pages/user_profile/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(
                Routes.updateProfile,
              );
            },
            icon: const Icon(
              Icons.edit_rounded,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const UserInfo(),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                authController.logoutUser();
              },
              child: const Text(
                'Sair',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
