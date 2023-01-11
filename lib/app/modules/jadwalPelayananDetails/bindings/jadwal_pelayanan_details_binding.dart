import 'package:get/get.dart';

import '../controllers/jadwal_pelayanan_details_controller.dart';

class JadwalPelayananDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalPelayananDetailsController>(
      () => JadwalPelayananDetailsController(),
    );
  }
}
