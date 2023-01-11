import 'package:get/get.dart';

import '../controllers/jadwal_pelayanan_petugas_add_controller.dart';

class JadwalPelayananPetugasAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalPelayananPetugasAddController>(
      () => JadwalPelayananPetugasAddController(),
    );
  }
}
