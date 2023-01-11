import 'package:get/get.dart';

import '../controllers/jadwal_pelayanan_add_controller.dart';

class JadwalPelayananAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalPelayananAddController>(
      () => JadwalPelayananAddController(),
    );
  }
}
