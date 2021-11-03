import 'package:get/get.dart';

import '../controllers/encoderesult_controller.dart';

class EncoderesultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EncoderesultController>(
      () => EncoderesultController(),
    );
  }
}
