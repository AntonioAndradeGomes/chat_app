import 'package:chat_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Nome Completo',
            prefixIcon: Icon(
              Icons.person,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
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
              onTap: () {},
              btnName: 'Cadastrar',
              icon: Icons.lock_open_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
