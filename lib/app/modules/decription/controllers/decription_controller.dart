import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DecriptionController extends GetxController {
  dynamic file;
  TextEditingController encriptionKeyCtrl = TextEditingController();
  Rx<Map<String, dynamic>> imageResult = Rx<Map<String, dynamic>>({});
  final ImagePicker _picker = ImagePicker();
  RxBool isLoading = RxBool(false);

  final _store = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> selectGalleryImage() async {
    final result = await _picker.pickImage(source: ImageSource.gallery);
    file = File(result!.path);
    update();
  }

  Future<void> getImage() async {
    if (encriptionKeyCtrl.text.isNotEmpty) {
      isLoading(true);
      final result =
          await _store.collection('images').doc(encriptionKeyCtrl.text).get();
      if (result.exists) {
        imageResult(result.data());
        isLoading(false);
      } else {
        Get.snackbar(
          'Error',
          'No image found',
          snackPosition: SnackPosition.BOTTOM,
        );
        isLoading(false);
      }
    } else {
      Get.snackbar(
        'Error',
        'You must Enter encription key',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
