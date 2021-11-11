import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EncoderesultController extends GetxController {
  dynamic file;
  RxString message = RxString("");
  RxString key = RxString("");
  final _store = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    file = Get.arguments["file"];
    message(Get.arguments["message"]);
    key(Get.arguments["key"]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  /// The user selects a file, and the task is added to the list.
  Future<String> uploadFile(File file) async {
    // Create a Reference to the file
    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});

    await _storage
        .ref()
        .child('upload/${file.path.split('/').last}')
        .putFile(File(file.path), metadata);
    final ref = _storage.ref().child('upload/${file.path.split('/').last}');

    final readUrl = await ref.getDownloadURL();

    return Future.value(readUrl);
  }

  Future<void> saveEncriptFile() async {
    try {
      isLoading(true);
      final result = await uploadFile(file);

      if (result.isNotEmpty) {
        CollectionReference encriptImage = _store.collection("images");

        await encriptImage.doc(key.value).set({
          "image": result.toString(),
          "message": message.value,
        });
        file = null;
        update();
        isLoading(false);
        Get.snackbar("Image", "Image encription successfull");
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar("Product", "Products upload failed");
    }
  }

  @override
  void onClose() {}
}
