import 'package:chat_app/pages/auth/widgets/login_form_widget.dart';
import 'package:chat_app/pages/auth/widgets/row_selection_page.dart';
import 'package:chat_app/pages/auth/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AuthModule {
  login('Entrar'),
  create('Cadastrar');

  final String label;
  const AuthModule(this.label);
}

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    Rx<AuthModule> isLogin = AuthModule.login.obs;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Obx(
            () => RowSelectionPage(
              onButtonClick: (value) {
                isLogin.value = value;
              },
              moduleSelected: isLogin.value,
            ),
          ),
          Obx(
            () => isLogin.value == AuthModule.login
                ? const LoginFormWidget()
                : const SignupFormWidget(),
          ),
        ],
      ),
    );
  }
}
