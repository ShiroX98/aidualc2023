import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  RxBool rememberMe = false.obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  final box = GetStorage();

  void errMsg(String msg) {
    Get.snackbar("TERJADI KESALAHAN", msg);
  }

  void login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        final credential = await auth.signInWithEmailAndPassword(
            email: emailC.text, password: passC.text);

        print(credential);

        isLoading.value = false;

        if (credential.user?.emailVerified == true) {
          if (box.read("rememberMe") != null) {
            await box.remove("rememberMe");
          }
          if (rememberMe.isTrue) {
            await box.write("rememberMe", {
              "email": emailC.text,
              "pass": passC.text,
            });
          }

          final querySnapshot = await FirebaseFirestore.instance
              .collection('users')
              .doc(credential.user?.uid)
              .get();

          if (querySnapshot.get('status') == "Aktif") {
            Get.offAllNamed(Routes.HOME, arguments: querySnapshot.get('level'));
          } else {
            await auth.signOut();
            Get.offAllNamed(Routes.LOGIN);
            errMsg("User tidak aktif.");
          }
        } else {
          print("User belum terverifikasi & tidak dapat login");
          Get.defaultDialog(
            title: "Belum Terverifikasi",
            middleText: "Apakah kamu ingin mengirim email verifikasi kembali?",
            actions: [
              OutlinedButton(
                onPressed: () => Get.back(),
                child: Text("Tidak"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    //kirim ulang email verifikasi
                    await credential.user?.sendEmailVerification();
                    Get.back();
                    print("BERHASIL MENGIRIM EMAIL VERIFIKASI");
                    Get.snackbar("BERHASIL",
                        "Kami telah mengirimkan email verifikasi. Buka email kamu untuk tahap verifikasi.");
                  } catch (e) {
                    print(e);
                    Get.back();
                    errMsg(
                        "Kamu terlalu banyak meminta kirim email verifikasi");
                  }
                },
                child: Text("KIRIM LAGI"),
              ),
            ],
          );
        }
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        print(e.code);
        errMsg("${e.code}");
      }
    } else {
      isLoading.value = false;
      errMsg("Email & Password harus diisi.");
    }
  }
}
