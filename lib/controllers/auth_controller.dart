import 'dart:developer';
import 'package:chat_app/config/routes/routes.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final firebaseAuth = FirebaseAuth.instance;
  final cloudFirestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  Future<void> login(
    String email,
    String password,
  ) async {
    isLoading.value = true;

    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(Routes.home);
    } on FirebaseAuthException catch (e, s) {
      if (e.code == 'user-not-found') {
        log(
          'No user found for that email.',
          error: e,
          stackTrace: s,
          time: DateTime.now(),
        );
      } else if (e.code == 'wrong-password') {
        log(
          'Wrong password provided for that user.',
          error: e,
          stackTrace: s,
          time: DateTime.now(),
        );
      } else {
        log(
          e.code,
          error: e,
          stackTrace: s,
          time: DateTime.now(),
        );
      }
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

  Future<void> createUser(
    String email,
    String password,
    String name,
  ) async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await initUser(email, name);
      Get.offAllNamed(Routes.home);
    } on FirebaseAuthException catch (e, s) {
      if (e.code == 'weak-password') {
        log(
          'The password provided is too weak.',
          error: e,
          stackTrace: s,
          time: DateTime.now(),
        );
      } else if (e.code == 'email-already-in-use') {
        log(
          'The account already exists for that email.',
          error: e,
          stackTrace: s,
          time: DateTime.now(),
        );
      } else {
        log(
          e.code,
          error: e,
          stackTrace: s,
          time: DateTime.now(),
        );
      }
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

  Future<void> initUser(String email, String name) async {
    final newUser = UserModel(
      email: email,
      name: name,
      id: firebaseAuth.currentUser!.uid,
    );
    try {
      await cloudFirestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .set(newUser.toJson);
    } catch (e, s) {
      log(
        e.toString(),
        error: e,
        stackTrace: s,
        time: DateTime.now(),
      );
    }
  }

  Future<void> logoutUser() async {
    await firebaseAuth.signOut();
    Get.offAllNamed(
      Routes.login,
    );
  }
}
