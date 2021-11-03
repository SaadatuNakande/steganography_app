// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
  }

  Future<String?> onLogin(LoginData data) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: data.name, password: data.password);
      Get.snackbar("success", "login sucessfull ${user.user?.email}");
    } catch (e) {
      return "login failed $e";
    }
  }

  Future<String?> onSignup(LoginData data) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(
          email: data.name, password: data.password);
      final usersReference = store.collection("users").doc(user.user?.uid);
      final result = await usersReference.set({
        "uid": usersReference.id,
        "email": data.name,
        "password": data.password
      });
      return null;
    } catch (e) {
      return "Signup failed";
    }
  }

  Future<String> onRecoverPassword() async {
    return "login page";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
