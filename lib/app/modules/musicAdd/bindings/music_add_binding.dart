import 'package:get/get.dart';

import '../controllers/music_add_controller.dart';

class MusicAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MusicAddController>(
      () => MusicAddController(),
    );
  }
}
