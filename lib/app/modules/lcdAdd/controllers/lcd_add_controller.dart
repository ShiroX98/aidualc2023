import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LcdAddController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamJemaat() async* {
    // String uid = auth.currentUser!.uid;

    yield* await firestore
        .collection("jemaats")
        .where('status_pelayanan', isEqualTo: 'Tidak Aktif')
        .snapshots();
  }
}
