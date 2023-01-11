import 'package:get/get.dart';

import '../controllers/lcd_add_controller.dart';

class LcdAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LcdAddController>(
      () => LcdAddController(),
    );
  }
}
