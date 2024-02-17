import 'package:chat_app/pages/auth/widgets/auth_page_body.dart';
import 'package:chat_app/pages/welcome/widgets/welcome_heading.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                WelcomeHeading(),
                SizedBox(
                  height: 40,
                ),
                AuthPageBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
