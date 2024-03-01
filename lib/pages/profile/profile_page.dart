import 'package:chat_app/controllers/profile_controller.dart';
import 'package:chat_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    final profileController = Get.put(ProfileController());
    final nameEC = TextEditingController(
      text: profileController.currentUser.value.name,
    );
    final emailEC = TextEditingController(
      text: profileController.currentUser.value.email,
    );
    final phoneEC = TextEditingController(
      text: profileController.currentUser.value.phoneNumber,
    );
    final aboutEC = TextEditingController(
      text: profileController.currentUser.value.about,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 20,
                left: 15,
                right: 15,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      child: const Icon(
                        Icons.image,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => TextField(
                      controller: nameEC,
                      enabled: isEdit.value,
                      decoration: const InputDecoration(
                        filled: false,
                        labelText: "Nome",
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => TextField(
                      enabled: isEdit.value,
                      controller: aboutEC,
                      decoration: const InputDecoration(
                        filled: false,
                        labelText: "Sobre",
                        prefixIcon: Icon(
                          Icons.info_rounded,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    controller: emailEC,
                    decoration: const InputDecoration(
                      filled: false,
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.alternate_email_rounded,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => TextField(
                      enabled: isEdit.value,
                      controller: phoneEC,
                      decoration: const InputDecoration(
                        filled: false,
                        labelText: "Número de telefone",
                        prefixIcon: Icon(
                          Icons.phone_rounded,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      width: 189,
                      child: Obx(
                        () => PrimaryButton(
                          btnName: isEdit.value ? "Save" : "Editar",
                          icon: isEdit.value ? Icons.save : Icons.edit,
                          onTap: isEdit.value
                              ? () {
                                  print("save");
                                  isEdit.value = true;
                                }
                              : () {
                                  print('edit');
                                  isEdit.value = true;
                                },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
