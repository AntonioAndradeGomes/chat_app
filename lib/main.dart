import 'package:chat_app/config/theme.dart';
import 'package:chat_app/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp Sampark',
      theme: ligthTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const WelcomePage(),
    );
  }
}
