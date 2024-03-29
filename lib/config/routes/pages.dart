import 'package:chat_app/config/routes/routes.dart';
import 'package:chat_app/pages/auth/auth_page.dart';
import 'package:chat_app/pages/chat/chat_page.dart';
import 'package:chat_app/pages/home/home_page.dart';
import 'package:chat_app/pages/splash/splash_page.dart';
import 'package:chat_app/pages/welcome/welcome_page.dart';
import 'package:get/get.dart';

import '../../pages/profile/profile_page.dart';

abstract class AppPages {
  static const initalRoute = Routes.splash;

  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const AuthPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.chat,
      page: () => const ChatPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
      transition: Transition.rightToLeft,
    ),
    /*GetPage(
      name: Routes.updateProfile,
      page: () => const UserUpdateProfilePage(),
      transition: Transition.rightToLeft,
    ),*/
  ];
}
