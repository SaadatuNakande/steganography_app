import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:encrypt/encrypt.dart' as encrypt;

class EncriptionController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  TextEditingController messageCtrl = TextEditingController();
  TextEditingController encriptionKeyCtrl = TextEditingController();

  dynamic file;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> captureCameraImage() async {
    final result = await _picker.pickImage(source: ImageSource.camera);
    file = File(result!.path);
    update();
  }

  Future<void> selectGalleryImage() async {
    final result = await _picker.pickImage(source: ImageSource.gallery);
    file = File(result!.path);
    update();
  }

  Future<void> encriptMessages() async {
    if (messageCtrl.text.isNotEmpty && encriptionKeyCtrl.text.isNotEmpty) {}
    Get.toNamed("/encoderesult", arguments: {
      "message": messageCtrl.text,
      "key": encriptionKeyCtrl.text,
      "file": file,
    });

    return;
  }

  @override
  void onClose() {
    messageCtrl.dispose();
    encriptionKeyCtrl.dispose();
  }
}
