import 'package:chat_app/config/routes/routes.dart';
import 'package:chat_app/pages/auth/auth_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => const AuthPage(),
      transition: Transition.rightToLeft,
    ),
  ];
}
