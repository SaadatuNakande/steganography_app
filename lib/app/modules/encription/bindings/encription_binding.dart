import 'package:get/get.dart';

import '../controllers/encription_controller.dart';

class EncriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EncriptionController>(
      () => EncriptionController(),
    );
  }
}
