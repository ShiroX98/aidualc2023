import 'package:get/get.dart';

import '../controllers/singers_add_controller.dart';

class SingersAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingersAddController>(
      () => SingersAddController(),
    );
  }
}
