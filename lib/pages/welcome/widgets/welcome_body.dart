import 'package:chat_app/config/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsImages.boyPic,
            ),
            SvgPicture.asset(
              AssetsImages.connetSVG,
            ),
            Image.asset(
              AssetsImages.girlPic,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Agora você está',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          'Conectado',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Solução perfeita para conectar-se com qualquer pessoa de forma fácil e segura',
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
