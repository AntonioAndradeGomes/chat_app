import 'package:chat_app/pages/auth/widgets/auth_page_body.dart';
import 'package:chat_app/pages/auth/widgets/item_selected_page.dart';
import 'package:flutter/material.dart';

class RowSelectionPage extends StatelessWidget {
  final void Function(AuthModule click) onButtonClick;
  final AuthModule moduleSelected;
  const RowSelectionPage({
    super.key,
    required this.onButtonClick,
    required this.moduleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ItemSelectedPage(
          module: AuthModule.login,
          isSelected: moduleSelected == AuthModule.login,
          onTap: () => onButtonClick(AuthModule.login),
        ),
        ItemSelectedPage(
          module: AuthModule.create,
          isSelected: moduleSelected == AuthModule.create,
          onTap: () => onButtonClick(AuthModule.create),
        ),
      ],
    );
  }
}
