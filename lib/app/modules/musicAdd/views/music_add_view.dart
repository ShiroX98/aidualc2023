import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/music_add_controller.dart';

class MusicAddView extends GetView<MusicAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MusicAddView'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamJemaat(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data?.docs.length == 0 || snapshot.data == null) {
              return Center(
                child: Text('Belum ada data Jemaat'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var docJemaat = snapshot.data!.docs[index];
                Map<String, dynamic> jemaat = docJemaat.data();
                print(jemaat);
                return ListTile(
                  onTap: () =>
                      Get.toNamed(Routes.JADWAL_PELAYANAN_ADD, arguments: [
                    {"first": docJemaat.id},
                    {"second": 'Music'}
                  ]),
                  title: Text("${jemaat['nama_jemaat']}"),
                  subtitle: Text("${jemaat['email']}"),
                  // trailing: IconButton(
                  //   onPressed: () {
                  //     controller.deleteJemaat(docJemaat.id, jemaat['uid']);
                  //   },
                  //   icon: Icon(Icons.delete),
                  // ),
                );
              },
            );
          }),
    );
  }
}
