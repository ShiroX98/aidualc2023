import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';
import 'package:get/get.dart';

class JadwalPelayananController extends GetxController {
  var levelValue = Get.arguments;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamJadwalPelayanan() async* {
    // String uid = auth.currentUser!.uid;

    if (levelValue == "admin") {
      yield* await firestore
          .collection("jadwal_pelayanans")
          .orderBy("createdAt")
          .snapshots();
    } else {
      yield* await firestore
          .collection("jemaats")
          .doc(auth.currentUser!.uid)
          .collection("riwayat_petugas")
          .snapshots();
    }
  }

  void deleteJadwalPelayanan(String docID, UID) async {
    try {
      var collectionTest = firestore.collection("jemaats");
      var snapshotsTest = await collectionTest.get();
      for (var doc in snapshotsTest.docs) {
        var collectionTestSub = doc.reference.collection("riwayat_petugas");
        var snapshotsTestSub = await collectionTestSub.get();
        for (var docSub in snapshotsTestSub.docs) {
          var data = docSub.data();
          if (data["pelayanan_uid"] == docID.toString()) {
            await docSub.reference.delete();
          }
        }
      }

      var collection = firestore
          .collection("jadwal_pelayanans")
          .doc(docID)
          .collection("petugas_pelayanans");
      var snapshots = await collection.get();
      for (var doc in snapshots.docs) {
        await doc.reference.delete();
      }

      await firestore.collection("jadwal_pelayanans").doc(docID).delete();

      Get.snackbar("BERHASIL", "Data jadwal pelayanan berhasil dihapus");
    } catch (e) {
      print(e);
      Get.snackbar("TERJADI KESALAHAN", "Tidak dapat menghapus jemaat.");
    }
  }
}
