import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';
import 'package:get/get.dart';

class JemaatController extends GetxController {
  var levelValue = Get.arguments;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void logout() async {
    try {
      await auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print(e);
      Get.snackbar("TERJADI KESALAHAN", "Tidak dapat logout.");
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamJemaat() async* {
    // String uid = auth.currentUser!.uid;

    yield* firestore.collection("jemaats").snapshots();

    // .where('status_jemaat', isEqualTo: 'Aktif')
    // print("levelValue");
  }

  void deleteJemaat(String docID, UID) async {
    var user = await auth.currentUser;

    AuthCredential credential = EmailAuthProvider.credential(
        email: "crossshiro7@gmail.com", password: "password");

    try {
      await firestore.collection("jemaats").doc(docID).delete();
      await auth.currentUser!.delete();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print(e);
      Get.snackbar("TERJADI KESALAHAN", "Tidak dapat menghapus jemaat.");
    }
  }
}
