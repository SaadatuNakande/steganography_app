// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/decription_controller.dart';

class DecriptionView extends GetView<DecriptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decode a message'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: controller.imageResult.value["image"] == null
                      ? Image.asset(
                          "assets/images/encription.jpeg",
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          controller.imageResult.value["image"],
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.encriptionKeyCtrl,
                  decoration: InputDecoration(
                      hintText: "Secret token",
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue.shade400,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.blue.shade400,
                  onPressed: () => controller.getImage(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      controller.isLoading.value
                          ? CircularProgressIndicator()
                          : Icon(Icons.camera),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Get Image"),
                    ],
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.blue.shade400,
                  onPressed: () {
                    if (controller.encriptionKeyCtrl.text.isNotEmpty) {
                      Get.toNamed("/decoderesult",
                          arguments: controller.imageResult.value);
                    } else {
                      Get.snackbar(
                        "Error",
                        "Please enter a key",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        borderRadius: 10,
                        margin: EdgeInsets.all(10),
                        animationDuration: Duration(seconds: 1),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.open_in_browser),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Decode My Message"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
