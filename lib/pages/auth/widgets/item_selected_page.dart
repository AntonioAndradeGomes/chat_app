import 'package:chat_app/pages/auth/widgets/auth_page_body.dart';
import 'package:flutter/material.dart';

class ItemSelectedPage extends StatelessWidget {
  final AuthModule module;
  final bool isSelected;
  final GestureTapCallback? onTap;
  const ItemSelectedPage({
    super.key,
    required this.module,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      /*onTap: () {
        isLogin.value = true;
      },*/
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 2.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              module.label,
              style: isSelected
                  ? Theme.of(context).textTheme.bodyLarge
                  : Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 200,
              ),
              width: isSelected ? 110 : 0,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
