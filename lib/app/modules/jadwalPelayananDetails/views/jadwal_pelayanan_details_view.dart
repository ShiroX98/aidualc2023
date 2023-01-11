import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/jadwal_pelayanan_details_controller.dart';

class JadwalPelayananDetailsView
    extends GetView<JadwalPelayananDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JadwalPelayananDetailsView'),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
          future: controller.getJadwalPelayananByID(Get.arguments.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == null) {
              return Center(
                child: Text(
                    "Tidak dapat mengambil informasi data jadwal pelayanan"),
              );
            }
            if (snapshot.data!['jumlah_hadir'] != null) {
              controller.jumlahHadir.text = snapshot.data!['jumlah_hadir'];
            }
            return ListView(
              padding: EdgeInsets.all(20),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 125.0,
                      child: Text("Nama Ibadah"),
                    ),
                    Container(
                      child: Text(":"),
                    ),
                    Container(
                      width: 225.0,
                      child: Text("${snapshot.data!['nama_ibadah']}"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 125.0,
                      child: Text("Waktu Ibadah"),
                    ),
                    Container(
                      child: Text(":"),
                    ),
                    Container(
                      width: 225.0,
                      child: Text(
                          "${DateFormat.yMMMd().format(DateTime.parse(snapshot.data!['tanggal_ibadah']))} - ${snapshot.data!['waktu_ibadah']}"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 125.0,
                      child: Text("Jumlah yang Hadir"),
                    ),
                    Container(
                      child: Text(":"),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 150.0,
                          child: TextField(
                            controller: controller.jumlahHadir,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        snapshot.data!['jumlah_hadir'] == null
                            ? TextButton(
                                onPressed: () {
                                  controller.simpanKehadiran(
                                      Get.arguments.toString());
                                },
                                child: Icon(Icons.add))
                            : TextButton(
                                onPressed: () {
                                  controller.simpanKehadiran(
                                      Get.arguments.toString());
                                },
                                child: Icon(Icons.edit))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Daftar Petugas Pelayanan"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller
                      .streamPetugasPelayanan(Get.arguments.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      // decoration: BoxDecoration(
                      //   border: Border.all(
                      //     color: Colors.grey,
                      //     width: 1,
                      //   ),
                      // ),
                      // padding: EdgeInsets.all(10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var docJemaat = snapshot.data!.docs[index];
                          Map<String, dynamic> jemaat = docJemaat.data();
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              title: Text("${jemaat['nama_jemaat']}"),
                              subtitle: Text("${jemaat['petugas']}"),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            );
          }),
    );
  }
}
