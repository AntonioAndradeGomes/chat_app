import 'package:flutter/material.dart';
//Todo: trocar por um filledbutton.icon

class PrimaryButton extends StatelessWidget {
  final String btnName;
  final IconData icon;

  const PrimaryButton({
    super.key,
    required this.btnName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            btnName,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
