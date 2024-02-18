import 'package:chat_app/config/assets_images.dart';
import 'package:chat_app/pages/chat/widgets/chat_bubble_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Image.asset(
              AssetsImages.girlPic,
              width: 40,
            ),
            const SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ellen Camille',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Online',
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.phone_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_call_rounded,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(54),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImages.mic,
                width: 25,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: false,
                  hintText: 'Digite a mensagem',
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImages.gallery,
                width: 25,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImages.send,
                width: 25,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          ChatBubbleWidget(
            message: 'Olá, como você está?',
            imageUrl: '',
            isComming: true,
            status: '',
            time: '10:10 PM',
          ),
          ChatBubbleWidget(
            message: 'Olá, como você está?',
            imageUrl: '',
            isComming: false,
            status: '',
            time: '10:11 PM',
          ),
          ChatBubbleWidget(
            message: 'Olha essa imagem',
            imageUrl:
                'https://img.freepik.com/fotos-premium/um-gato-gordo-com-um-pelo-branco-e-fofo_902338-17120.jpg?w=740',
            isComming: false,
            status: '',
            time: '10:11 PM',
          ),
          ChatBubbleWidget(
            message: 'Olá, como você está?',
            imageUrl: '',
            isComming: false,
            status: '',
            time: '10:10 PM',
          ),
          ChatBubbleWidget(
            message: 'Olá, como você está?',
            imageUrl: '',
            isComming: true,
            status: '',
            time: '10:11 PM',
          ),
          ChatBubbleWidget(
            message: 'Olha essa imagem',
            imageUrl:
                'https://img.freepik.com/fotos-premium/um-gato-gordo-com-um-pelo-branco-e-fofo_902338-17120.jpg?w=740',
            isComming: true,
            status: '',
            time: '10:11 PM',
          ),
        ],
      ),
    );
  }
}
