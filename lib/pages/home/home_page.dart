import 'package:chat_app/config/assets_images.dart';
import 'package:chat_app/config/routes/routes.dart';
import 'package:chat_app/controllers/profile_controller.dart';
import 'package:chat_app/pages/home/widgets/chat_list_widget.dart';
import 'package:chat_app/pages/home/widgets/my_tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tabController = TabController(
      length: 3,
      vsync: this,
    );

    Get.put(ProfileController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Contato chat',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              AssetsImages.appIconSVG,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(
                  Routes.profile,
                );
              },
              icon: const Icon(
                Icons.more_vert_rounded,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: MyTabBarWidget(
              tabController: tabController,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            const ChatListWidget(),
            ListView(
              children: const [
                ListTile(
                  title: Text('Name teste'),
                ),
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text('Name teste'),
                ),
              ],
            ),
          ],
        ));
  }
}
