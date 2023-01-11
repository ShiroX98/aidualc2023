import 'package:get/get.dart';

import '../controllers/jemaat_edit_controller.dart';

class JemaatEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JemaatEditController>(
      () => JemaatEditController(),
    );
  }
}
