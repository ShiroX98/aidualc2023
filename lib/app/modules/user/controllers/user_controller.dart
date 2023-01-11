import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var levelValue = Get.arguments;
  FirebaseAuth auth = FirebaseAuth.instance;

  void logout() async {
    try {
      await auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print(e);
      Get.snackbar("TERJADI KESALAHAN", "Tidak dapat logout.");
    }
  }
}
