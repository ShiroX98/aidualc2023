import 'package:get/get.dart';

import '../controllers/jemaat_add_controller.dart';

class JemaatAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JemaatAddController>(
      () => JemaatAddController(),
    );
  }
}
