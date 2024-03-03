import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameEC = TextEditingController();
    final emailEC = TextEditingController();
    final passwordEC = TextEditingController();
    final controller = Get.put(AuthController());
    return Column(
      children: [
        const SizedBox(
          height: 36,
        ),
        TextField(
          controller: fullNameEC,
          decoration: const InputDecoration(
            hintText: 'Nome Completo',
            prefixIcon: Icon(
              Icons.person,
            ),
          ),
        ),
        const SizedBox(
          height: 36,
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
          height: 36,
        ),
        TextField(
          controller: passwordEC,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Senha',
            prefixIcon: Icon(
              Icons.password_outlined,
            ),
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator.adaptive()
                  : PrimaryButton(
                      onTap: () {
                        controller.createUser(
                          emailEC.text.trim(),
                          passwordEC.text,
                          fullNameEC.text.trim(),
                        );
                      },
                      btnName: 'Cadastrar',
                      icon: Icons.lock_open_outlined,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
