import 'dart:developer';
import 'dart:io';
import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final firebaseAuth = FirebaseAuth.instance;
  final cloudFirestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  RxBool isLoading = false.obs;
  Rx<UserModel> currentUser = UserModel().obs;

  @override
  void onInit() async {
    await getUserDetails();
    super.onInit();
  }

  Future<void> getUserDetails() async {
    await cloudFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get()
        .then(
          (value) => {
            currentUser.value = UserModel.fromJson(
              value.data()!,
            )
          },
        );
  }

  Future<void> uploadProfile(
    String imageUrl,
    String name,
    String about,
    String number,
  ) async {
    isLoading.value = true;

    try {
      final imageLink = await uploadFileToFirebase(imageUrl);
      final updatedUser = UserModel(
        id: firebaseAuth.currentUser!.uid,
        email: firebaseAuth.currentUser!.email,
        name: name,
        about: about,
        profileImage: imageLink ?? currentUser.value.profileImage,
        phoneNumber: number,
      );
      await cloudFirestore
          .collection("users")
          .doc(
            firebaseAuth.currentUser!.uid,
          )
          .set(
            updatedUser.toJson,
          );
      getUserDetails();
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
        error: e,
        time: DateTime.now(),
      );
    }
    isLoading.value = false;
  }

  Future<String?> uploadFileToFirebase(String imagePath) async {
    final path = "files/$imagePath";
    final file = File(imagePath);
    if (imagePath != "") {
      try {
        //TODO: corrigir o path, ter um historico de fotos de perfil do usuários
        final ref = storage.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});

        final downloadImageUrl = await uploadTask.ref.getDownloadURL();
        log("download: $downloadImageUrl");
        return downloadImageUrl;
      } catch (e, s) {
        log(
          e.toString(),
          error: e,
          stackTrace: s,
          time: DateTime.now(),
        );
        return null;
      }
    }
    return null;
  }
}
