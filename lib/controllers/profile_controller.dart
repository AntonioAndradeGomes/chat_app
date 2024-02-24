import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final firebaseAuth = FirebaseAuth.instance;
  final cloudFirestore = FirebaseFirestore.instance;

  Rx<UserModel> currentUser = UserModel().obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserDetails();
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
}
