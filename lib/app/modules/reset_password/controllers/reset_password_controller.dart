import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void errMsg(msg) {
    Get.snackbar("TERJADI KESALAHAN", msg);
  }

  void resetPassword() async {
    if (emailC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await auth.sendPasswordResetEmail(email: emailC.text);

        isLoading.value = false;
        Get.back();
        Get.snackbar("BERHASIL",
            "Kami telah mengirim link untuk reset password ke email kamu.");
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        errMsg("${e.code}");
      } catch (e) {
        isLoading.value = false;
        errMsg("Tidak dapat mengirim password ke email ini.");
      }
    } else {
      isLoading.value = false;
      errMsg("Email harus diisi.");
    }
  }
}
