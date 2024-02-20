import 'dart:developer';

import 'package:chat_app/config/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    toPage();
  }

  Future<void> toPage() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    if (firebaseAuth.currentUser == null) {
      Get.offAllNamed(Routes.login);
    } else {
      log('User: ${firebaseAuth.currentUser.toString()}');
      Get.offAllNamed(Routes.home);
    }
  }
}
