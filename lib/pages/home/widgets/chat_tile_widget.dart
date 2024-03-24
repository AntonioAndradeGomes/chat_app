import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatTileWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String lastChat;
  final String lastTime;
  final GestureTapCallback? onTap;
  const ChatTileWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.lastChat,
    required this.lastTime,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 54,
                      width: 54,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          imageUrl,
                          width: 54,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          lastChat,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  lastTime,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
