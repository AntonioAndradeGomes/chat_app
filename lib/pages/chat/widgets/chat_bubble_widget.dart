import 'package:chat_app/config/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatBubbleWidget extends StatelessWidget {
  final String message;
  final bool isComming;
  final String time;
  final String status;
  final String imageUrl;
  const ChatBubbleWidget({
    super.key,
    required this.message,
    required this.isComming,
    required this.time,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment:
            isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            constraints: BoxConstraints(
              minWidth: 0,
              maxWidth: MediaQuery.of(context).size.width / 1.5,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
                bottomLeft: Radius.circular(isComming ? 0 : 10),
                bottomRight: Radius.circular(isComming ? 10 : 0),
              ),
            ),
            child: imageUrl.isEmpty
                ? Text(
                    message,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageUrl,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        message,
                      ),
                    ],
                  ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment:
                isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              isComming
                  ? Text(
                      time,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  : Row(
                      children: [
                        Text(
                          time,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          AssetsImages.chatStatus,
                          width: 20,
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
