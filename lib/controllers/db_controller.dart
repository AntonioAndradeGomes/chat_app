import 'dart:developer';
import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DbController extends GetxController {
  final firebaseAuth = FirebaseAuth.instance;
  final cloudFirestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  RxList<UserModel> userList = <UserModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserList();
  }

  Future<void> getUserList() async {
    isLoading.value = true;
    try {
      userList.clear();
      await cloudFirestore.collection("users").get().then(
            (value) => {
              userList.value = value.docs
                  .map(
                    (e) => UserModel.fromJson(
                      e.data(),
                    ),
                  )
                  .toList()
            },
          );
    } catch (e, s) {
      log(
        e.toString(),
        error: e,
        stackTrace: s,
        time: DateTime.now(),
      );
    }
    isLoading.value = false;
  }
}
