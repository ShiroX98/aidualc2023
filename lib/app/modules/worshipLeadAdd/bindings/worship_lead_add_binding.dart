import 'package:get/get.dart';

import '../controllers/worship_lead_add_controller.dart';

class WorshipLeadAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorshipLeadAddController>(
      () => WorshipLeadAddController(),
    );
  }
}
