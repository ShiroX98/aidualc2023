import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;

  TextEditingController nameC = TextEditingController();
  TextEditingController notelpC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void errMsg(String msg) {
    Get.snackbar("TERJADI KESALAHAN", msg);
  }

  void register() async {
    if (nameC.text.isNotEmpty &&
        notelpC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        passC.text.isNotEmpty) {
      try {
        isLoading.value = true;
        final credential = await auth.createUserWithEmailAndPassword(
            email: emailC.text, password: passC.text);

        isLoading.value = false;

        // kirim email verifikasi
        await credential.user?.sendEmailVerification();

        await firestore.collection("users").doc(credential.user?.uid).set({
          "name": nameC.text,
          "notelp": notelpC.text,
          "email": emailC.text,
          "uid": credential.user?.uid,
          "createdAt": DateTime.now().toIso8601String(),
        });

        Get.offAllNamed(Routes.LOGIN);
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        print(e.code);
        errMsg("${e.code}");
      } catch (e) {
        isLoading.value = false;
        print(e);
        errMsg("$e");
      }
    } else {
      isLoading.value = false;
      errMsg("Semua harus diisi");
    }
  }
}
