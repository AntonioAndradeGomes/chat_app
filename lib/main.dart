import 'package:chat_app/config/routes/pages.dart';
import 'package:chat_app/config/theme/theme.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
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
