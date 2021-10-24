// ignore_for_file: avoid_print

import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<String?> onLogin(LoginData data) async {
    if (data.name == "ismailawa.aliyu@gmail.com") {
      return null;
    }
    print(data);
    return "login page";
  }

  Future<String> onSignup(LoginData data) async {
    print(data);
    return "login page";
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
  void increment() => count.value++;
}
