import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class JadwalPelayananDetailsController extends GetxController {
  TextEditingController jumlahHadir = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void simpanKehadiran(String docID) async {
    try {
      await firestore.collection("jadwal_pelayanans").doc(docID).update({
        "jumlah_hadir": jumlahHadir.text,
      });
      // Get.back();
      Get.snackbar("BERHASIL", "Jumlah Kehadiran berhasil disimpan");
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>?> getJadwalPelayananByID(String docID) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await firestore.collection("jadwal_pelayanans").doc(docID).get();
      return doc.data();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamPetugasPelayanan(
      String docID) async* {
    // String uid = auth.currentUser!.uid;

    yield* await firestore
        .collection("jadwal_pelayanans")
        .doc(docID)
        .collection("petugas_pelayanans")
        .orderBy('petugas')
        .snapshots();
  }
}
