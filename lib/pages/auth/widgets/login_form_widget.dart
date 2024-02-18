import 'package:chat_app/config/routes/routes.dart';
import 'package:chat_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.alternate_email_rounded,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const TextField(
          decoration: InputDecoration(
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
