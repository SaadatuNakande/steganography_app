// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/encoderesult_controller.dart';

class EncoderesultView extends GetView<EncoderesultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoorey! Encoded!'),
        centerTitle: true,
      ),
      body: Obx(
        () => Padding(
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
                child: controller.message.value.isNotEmpty &&
                        controller.file != null
                    ? Image.file(
                        controller.file,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/images/encription.jpeg",
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
                onPressed: () => controller.saveEncriptFile(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.isLoading.value
                        ? CircularProgressIndicator()
                        : Icon(Icons.save),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Save"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
