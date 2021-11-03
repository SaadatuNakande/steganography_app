import 'package:get/get.dart';

import '../controllers/decription_controller.dart';

class DecriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DecriptionController>(
      () => DecriptionController(),
    );
  }
}
