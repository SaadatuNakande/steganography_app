import 'package:get/get.dart';

import '../controllers/decoderesult_controller.dart';

class DecoderesultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DecoderesultController>(
      () => DecoderesultController(),
    );
  }
}
