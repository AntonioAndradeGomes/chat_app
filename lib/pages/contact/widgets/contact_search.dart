import 'package:flutter/material.dart';

class ContactSearch extends StatelessWidget {
  const ContactSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: TextField(
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {
          print("value");
        },
        decoration: const InputDecoration(
          hintText: "Buscar contato",
          prefixIcon: Icon(
            Icons.search_rounded,
          ),
        ),
      ),
    );
  }
}
