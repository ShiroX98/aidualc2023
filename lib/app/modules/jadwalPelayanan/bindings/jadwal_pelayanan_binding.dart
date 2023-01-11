import 'package:get/get.dart';

import '../controllers/jadwal_pelayanan_controller.dart';

class JadwalPelayananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalPelayananController>(
      () => JadwalPelayananController(),
    );
  }
}
