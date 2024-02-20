import 'package:chat_app/config/assets_images.dart';
import 'package:chat_app/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AssetsImages.appIconSVG,
        ),
      ),
    );
  }
}
