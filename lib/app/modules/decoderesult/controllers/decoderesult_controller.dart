import 'package:get/get.dart';

class DecoderesultController extends GetxController {
  Rx<Map<String, dynamic>> imageResult = Rx<Map<String, dynamic>>({});
  @override
  void onInit() {
    super.onInit();
    imageResult(Get.arguments);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
