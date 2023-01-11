import 'package:get/get.dart';

import '../controllers/jemaat_controller.dart';

class JemaatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JemaatController>(
      () => JemaatController(),
    );
  }
}
