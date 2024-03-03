import 'dart:io';

import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/controllers/image_picker_controller.dart';
import 'package:chat_app/controllers/profile_controller.dart';
import 'package:chat_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: variaveis para corrigir no controller
    RxBool isEdit = false.obs;
    ProfileController profileController = Get.put(ProfileController());
    final authController = Get.put(AuthController());
    TextEditingController nameEC = TextEditingController(
      text: profileController.currentUser.value.name,
    );
    TextEditingController emailEC = TextEditingController(
      text: profileController.currentUser.value.email,
    );
    TextEditingController phoneEC = TextEditingController(
      text: profileController.currentUser.value.phoneNumber,
    );
    TextEditingController aboutEC = TextEditingController(
      text: profileController.currentUser.value.about,
    );

    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    RxString imagePath = "".obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
        ),
        actions: [
          IconButton(
            onPressed: () {
              authController.logoutUser();
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
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
                    child: Obx(
                      () => isEdit.value
                          ? InkWell(
                              onTap: () async {
                                imagePath.value =
                                    await imagePickerController.pickImage();
                              },
                              child: Container(
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  shape: BoxShape.circle,
                                ),
                                child: imagePath.value == ""
                                    ? const Icon(
                                        Icons.add,
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.file(
                                          fit: BoxFit.cover,
                                          File(
                                            imagePath.value,
                                          ),
                                        ),
                                      ),
                              ),
                            )
                          : Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                shape: BoxShape.circle,
                              ),
                              child: profileController
                                              .currentUser.value.profileImage ==
                                          null ||
                                      profileController
                                              .currentUser.value.profileImage ==
                                          ""
                                  ? const Icon(
                                      Icons.image,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        fit: BoxFit.cover,
                                        profileController
                                            .currentUser.value.profileImage!,
                                      ),
                                    ),
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
                        () => profileController.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : PrimaryButton(
                                btnName: isEdit.value ? "Save" : "Editar",
                                icon: isEdit.value ? Icons.save : Icons.edit,
                                onTap: isEdit.value
                                    ? () async {
                                        await profileController.uploadProfile(
                                          imagePath.value,
                                          nameEC.text.trim(),
                                          aboutEC.text.trim(),
                                          phoneEC.text.trim(),
                                        );
                                        isEdit.value = false;
                                      }
                                    : () {
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
