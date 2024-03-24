import 'package:chat_app/config/assets_images.dart';
import 'package:chat_app/controllers/contact_controller.dart';
import 'package:chat_app/pages/contact/widgets/contact_search.dart';
import 'package:chat_app/pages/contact/widgets/new_contact_tile.dart';
import 'package:chat_app/pages/home/widgets/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isSearchEnable = false.obs;
    final contactController = Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selecione o contato',
        ),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon: Icon(
                isSearchEnable.value ? Icons.close : Icons.search_rounded,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Obx(
            () =>
                isSearchEnable.value ? const ContactSearch() : const SizedBox(),
          ),
          NewContactTile(
            btnName: "Novo Contato",
            onTap: () {},
          ),
          const SizedBox(
            height: 15,
          ),
          NewContactTile(
            btnName: "Criar Contato",
            icon: Icons.group_add_rounded,
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Text("Contatos no Contato Chat"),
          ),
          Obx(
            () => contactController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Column(
                    /*  children: List.generate(
                        10,
                        (index) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: ChatTileWidget(
                                  imageUrl: AssetsImages.girlPic,
                                  lastChat: 'Quero te bater!',
                                  lastTime: '09:10 PM',
                                  name: 'Ellen Camille ',
                                ),
                              ),
                            )),*/
                    children: contactController.userList
                        .map(
                          (element) => ChatTileWidget(
                            onTap: () {},
                            imageUrl: element.profileImage ??
                                AssetsImages.defaultImage,
                            name: element.name!,
                            lastChat: element.about ?? "Hey!",
                            lastTime: "",
                          ),
                        )
                        .toList()),
          ),
        ],
      ),
    );
  }
}
