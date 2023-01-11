import 'package:get/get.dart';

import '../controllers/jemaat_detail_controller.dart';

class JemaatDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JemaatDetailController>(
      () => JemaatDetailController(),
    );
  }
}
