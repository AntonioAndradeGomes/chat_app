import 'package:chat_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 40,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.alternate_email_rounded,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Senha',
            prefixIcon: Icon(
              Icons.password_outlined,
            ),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              btnName: 'Login',
              icon: Icons.lock_open_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
