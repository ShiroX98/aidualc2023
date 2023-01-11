import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JemaatAddController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  var tanggalLahir = DateTime.now().obs;
  String jenisKelamin = 'Laki-laki';

  TextEditingController namaC = TextEditingController();
  TextEditingController asalC = TextEditingController();
  TextEditingController tempatLahirC = TextEditingController();
  // TextEditingController tanggalLahirC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController notlpC = TextEditingController();
  TextEditingController pekerjaanC = TextEditingController();
  TextEditingController genderC = TextEditingController();
  // TextEditingController statusJemaatC = TextEditingController();
  // TextEditingController statusPelayananC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  // TextEditingController passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void errMsg(String msg) {
    Get.snackbar("TERJADI KESALAHAN", msg);
  }

  void jemaatAdd() async {
    if (namaC.text.isNotEmpty &&
        asalC.text.isNotEmpty &&
        tempatLahirC.text.isNotEmpty &&
        alamatC.text.isNotEmpty &&
        notlpC.text.isNotEmpty &&
        pekerjaanC.text.isNotEmpty &&
        emailC.text.isNotEmpty) {
      try {
        isLoading.value = true;
        final credential = await auth.createUserWithEmailAndPassword(
            email: emailC.text, password: "password");

        isLoading.value = false;

        // kirim email verifikasi
        await credential.user?.sendEmailVerification();

        await firestore.collection("jemaats").doc(credential.user?.uid).set({
          "nama_jemaat": namaC.text,
          "asal_jemaat": asalC.text,
          "tempat_lahir_jemaat": tempatLahirC.text,
          "tanggal_lahir_jemaat": tanggalLahir.toString(),
          "alamat_jemaat": alamatC.text,
          "notelp_jemaat": notlpC.text,
          "pekerjaan_jemaat": pekerjaanC.text,
          "gender_jemaat": jenisKelamin,
          "status_jemaat": "Aktif",
          "status_pelayanan": "Tidak Aktif",
          "email": emailC.text,
          "uid": credential.user?.uid,
          "createdAt": DateTime.now().toIso8601String(),
        });

        await firestore.collection("users").doc(credential.user?.uid).set({
          "name": namaC.text,
          "notelp": notlpC.text,
          "email": emailC.text,
          "level": "jemaats",
          "uid": credential.user?.uid,
          "createdAt": DateTime.now().toIso8601String(),
        });

        var querySnapshot = await firestore
            .collection("users")
            .doc(auth.currentUser?.uid)
            .get();
        var levelValue = querySnapshot.get('level');

        Get.offAllNamed(Routes.JEMAAT, arguments: levelValue);
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

  pilihTanggal() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: tanggalLahir.value,
        firstDate: DateTime(1945),
        lastDate: DateTime(2100));
    if (pickedDate != null && pickedDate != tanggalLahir.value) {
      tanggalLahir.value = pickedDate;
    }
  }

  pilihJenisKelamin(value) async {
    jenisKelamin = value;
    print(jenisKelamin);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamJemaaat() async* {
    yield* await firestore
        .collection("jemaats")
        .orderBy("nama_jemaat")
        .snapshots();
  }
}
