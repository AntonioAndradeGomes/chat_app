import 'package:chat_app/config/routes/routes.dart';
import 'package:chat_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final emailEC = TextEditingController();
    final passwordEC = TextEditingController();
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        TextField(
          controller: emailEC,
          decoration: const InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.alternate_email_rounded,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: passwordEC,
          decoration: const InputDecoration(
            hintText: 'Senha',
            prefixIcon: Icon(
              Icons.password_outlined,
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              onTap: () {
                Get.offAllNamed(
                  Routes.home,
                );
              },
              btnName: 'Login',
              icon: Icons.lock_open_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
