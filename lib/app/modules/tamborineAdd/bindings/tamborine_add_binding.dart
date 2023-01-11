import 'package:get/get.dart';

import '../controllers/tamborine_add_controller.dart';

class TamborineAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TamborineAddController>(
      () => TamborineAddController(),
    );
  }
}
