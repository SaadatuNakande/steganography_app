// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/encription_controller.dart';

class EncriptionView extends GetView<EncriptionController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EncriptionController>(
        init: EncriptionController(),
        builder: (ctrl) => Scaffold(
              appBar: AppBar(
                title: Text('Encode a message'),
              ),
              body: SingleChildScrollView(
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
                        child: ctrl.file == null
                            ? Image.asset(
                                "assets/images/encription.jpeg",
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                ctrl.file,
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Colors.blue.shade400,
                        onPressed: () => ctrl.selectGalleryImage(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Choose from Gallery"),
                          ],
                        ),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Colors.blue.shade400,
                        onPressed: () => ctrl.captureCameraImage(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Take Picture with Camera"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: ctrl.messageCtrl,
                        decoration: InputDecoration(
                            hintText: "Message",
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
                        height: 20,
                      ),
                      TextField(
                        controller: ctrl.encriptionKeyCtrl,
                        decoration: InputDecoration(
                            hintText: "Encription Key",
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
                        height: 20,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Colors.blue.shade400,
                        onPressed: () => ctrl.encriptMessages(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.mail),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Encode My Message"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
