import 'package:get/get.dart';

import '../controllers/asher_add_controller.dart';

class AsherAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AsherAddController>(
      () => AsherAddController(),
    );
  }
}
