import 'package:chat_app/config/assets_images.dart';
import 'package:chat_app/config/routes/routes.dart';
import 'package:chat_app/pages/home/widgets/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(5),
      itemCount: 2,
      itemBuilder: (_, index) {
        return ChatTileWidget(
          onTap: () {
            Get.toNamed(
              Routes.chat,
            );
          },
          imageUrl: AssetsImages.defaultImage,
          lastChat: 'Quero te bater!',
          lastTime: '09:10 PM',
          name: 'Ellen Camille $index',
        );
      },
      separatorBuilder: (_, index) {
        return const SizedBox(
          height: 15,
        );
      },
    );
  }
}
