import 'package:flutter/material.dart';

class MyTabBarWidget extends StatelessWidget {
  final TabController tabController;
  const MyTabBarWidget({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorWeight: 4,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: Theme.of(context).textTheme.bodyMedium,
      unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
      splashBorderRadius: BorderRadius.circular(60),
      tabs: const [
        Text(
          'Conversas',
        ),
        Text(
          'Grupos',
        ),
        Text(
          'Chamadas',
        ),
      ],
    );
  }
}
