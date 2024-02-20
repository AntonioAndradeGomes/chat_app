import 'package:chat_app/config/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: ajustar colocar no padrão do whatsapp
    return Container(
      //height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              AssetsImages.boyPic,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Antonio Andrade',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Center(
            child: Text(
              'gomesmax1997@gmail.com',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: Color(0xFF039C00),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Ligar',
                      style: TextStyle(
                        color: Color(0xFF039C00),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AssetsImages.videoSVG,
                      width: 20,
                      color: const Color(0xFFFF9900),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Vídeo',
                      style: TextStyle(
                        color: Color(0xFFFF9900),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AssetsImages.appIconSVG,
                      width: 20,
                      color: const Color(0xFF0057FF),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Chat',
                      style: TextStyle(
                        color: Color(0xFF0057FF),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
