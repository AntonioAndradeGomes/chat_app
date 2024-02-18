import 'package:chat_app/config/routes/pages.dart';
import 'package:chat_app/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatApp Sampark',
      theme: ligthTheme,
      darkTheme: darkTheme,
      getPages: AppPages.pages,
      themeMode: ThemeMode.dark,
      initialRoute: AppPages.initalRoute,
    );
  }
}
