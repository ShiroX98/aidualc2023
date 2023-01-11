import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JemaatEditController extends GetxController {
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
  TextEditingController statusJemaatC = TextEditingController();
  // TextEditingController statusPelayananC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getJemaatByID(String docID) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await firestore.collection("jemaats").doc(docID).get();
      return doc.data();
    } catch (e) {
      print(e);
      return null;
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
    // print(jenisKelamin);
  }

  void jemaatEdit(String docID) async {
    if (namaC.text.isNotEmpty &&
        asalC.text.isNotEmpty &&
        tempatLahirC.text.isNotEmpty &&
        alamatC.text.isNotEmpty &&
        notlpC.text.isNotEmpty &&
        pekerjaanC.text.isNotEmpty &&
        statusJemaatC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await firestore.collection("jemaats").doc(docID).update({
          "nama_jemaat": namaC.text,
          "asal_jemaat": asalC.text,
          "tempat_lahir_jemaat": tempatLahirC.text,
          "tanggal_lahir_jemaat": tanggalLahir.toString(),
          "alamat_jemaat": alamatC.text,
          "notelp_jemaat": notlpC.text,
          "pekerjaan_jemaat": pekerjaanC.text,
          "gender_jemaat": jenisKelamin,
          "status_jemaat": statusJemaatC.text,
        });

        await firestore
            .collection("users")
            .doc(docID)
            .update({"status": statusJemaatC.text});
        isLoading.value = false;
        Get.back();
      } catch (e) {
        isLoading.value = false;
        print(e);
        Get.snackbar(
            "TERJADI KESALAHAN", "Tidak dapat mengubah data jemaat ini.");
      }
    } else {
      Get.snackbar("TERJADI KESALAHAN", "Semua harus diisi.");
    }
  }
}
