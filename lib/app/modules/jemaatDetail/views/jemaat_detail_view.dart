import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/jemaat_detail_controller.dart';

class JemaatDetailView extends GetView<JemaatDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JemaatDetailView'),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
          future: controller.getJemaatByID(Get.arguments.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == null) {
              return Center(
                child: Text("Tidak dapat mengambil informasi data jemaat"),
              );
            } else {
              // controller.jenisKelamin = snapshot.data!["gender_jemaat"];
              // controller.tanggalLahir.value =
              //     DateTime.parse(snapshot.data!["tanggal_lahir_jemaat"]);
              // controller.namaC.text = snapshot.data!["nama_jemaat"];
              // controller.asalC.text = snapshot.data!["asal_jemaat"];
              // controller.tempatLahirC.text =
              //     snapshot.data!["tempat_lahir_jemaat"];
              // controller.alamatC.text = snapshot.data!["alamat_jemaat"];
              // controller.notlpC.text = snapshot.data!["notelp_jemaat"];
              // controller.pekerjaanC.text = snapshot.data!["pekerjaan_jemaat"];
              // controller.genderC.text = snapshot.data!["gender_jemaat"];
              // controller.statusJemaatC.text = snapshot.data!["status_jemaat"];
              // controller.statusPelayananC.text =
              //     snapshot.data!["status_pelayanan"];
            }
            return ListView(padding: EdgeInsets.all(20), children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    child: Text("Nama"),
                  ),
                  Container(
                    child: Text(":"),
                  ),
                  Container(
                    width: 250.0,
                    child: Text("${snapshot.data!['nama_jemaat']}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    child: Text("Asal"),
                  ),
                  Container(
                    child: Text(":"),
                  ),
                  Container(
                    width: 250.0,
                    child: Text("${snapshot.data!['asal_jemaat']}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    child: Text("Tempat Lahir"),
                  ),
                  Container(
                    child: Text(":"),
                  ),
                  Container(
                    width: 250.0,
                    child: Text("${snapshot.data!['tempat_lahir_jemaat']}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    child: Text("Tanggal Lahir"),
                  ),
                  Container(
                    child: Text(":"),
                  ),
                  Container(
                    width: 250.0,
                    child: Text(
                        "${DateFormat.yMMMd().format(DateTime.parse(snapshot.data!['tanggal_lahir_jemaat']))}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    child: Text("Alamat"),
                  ),
                  Container(
                    child: Text(":"),
                  ),
                  Container(
                    width: 250.0,
                    child: Text("${snapshot.data!['alamat_jemaat']}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    child: Text("No Telp"),
                  ),
                  Container(
                    child: Text(":"),
                  ),
                  Container(
                    width: 250.0,
                    child: Text("${snapshot.data!['notelp_jemaat']}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    child: Text("Pekerjaan"),
                  ),
                  Container(
                    child: Text(":"),
                  ),
                  Container(
                    width: 250.0,
                    child: Text("${snapshot.data!['pekerjaan_jemaat']}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    child: Text("Jenis Kelamin"),
                  ),
                  Container(
                    child: Text(":"),
                  ),
                  Container(
                    width: 250.0,
                    child: Text("${snapshot.data!['gender_jemaat']}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    child: Text("Email"),
                  ),
                  Container(
                    child: Text(":"),
                  ),
                  Container(
                    width: 250.0,
                    child: Text("${snapshot.data!['email']}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    child: Text("Status Jemaat"),
                  ),
                  Container(
                    child: Text(":"),
                  ),
                  Container(
                    width: 250.0,
                    child: Text("${snapshot.data!['status_jemaat']}"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Riwayat Pelayanan"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream:
                    controller.streamRiwayatPelayanan(Get.arguments.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(10),
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
                            title: Text(
                                "${jemaat['nama_ibadah']} - ${DateFormat.yMMMd().format(DateTime.parse(jemaat['tanggal_ibadah']))}"),
                            subtitle: Text("${jemaat['petugas']}"),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ]);
          }),
    );
  }
}
