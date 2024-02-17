import 'package:chat_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 40,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Nome Completo',
            prefixIcon: Icon(
              Icons.person,
            ),
          ),
        ),
        SizedBox(
          height: 30,
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
              btnName: 'Cadastrar',
              icon: Icons.lock_open_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
