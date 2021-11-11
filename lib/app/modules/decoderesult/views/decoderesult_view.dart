// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/decoderesult_controller.dart';

class DecoderesultView extends GetView<DecoderesultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Here is your message!',
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Decoded Message:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              controller.imageResult.value["message"] == null
                  ? Text(
                      'No Results Found',
                      style: TextStyle(fontSize: 20),
                    )
                  : Text(
                      controller.imageResult.value["message"],
                      style: TextStyle(fontSize: 20),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
