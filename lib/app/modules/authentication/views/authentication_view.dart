// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, null_closures

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'UJ Project',
        // logo: 'assets/images/appIcon.png',
        onLogin: controller.onLogin,
        onSignup: controller.onSignup,

        onSubmitAnimationCompleted: () {
          Get.offAllNamed("/dashboard");
        },
        onRecoverPassword: (_) => controller.onRecoverPassword(),
      ),
    );
  }
}
