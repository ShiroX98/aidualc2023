import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class JemaatDetailController extends GetxController {
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

  Stream<QuerySnapshot<Map<String, dynamic>>> streamRiwayatPelayanan(
      String docID) async* {
    // String uid = auth.currentUser!.uid;

    yield* await firestore
        .collection("jemaats")
        .doc(docID)
        .collection("riwayat_petugas")
        .snapshots();
  }
}
