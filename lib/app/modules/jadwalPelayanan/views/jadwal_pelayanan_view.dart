import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/jadwal_pelayanan_controller.dart';

class JadwalPelayananView extends GetView<JadwalPelayananController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JADWAL PELAYANAN'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.PROFILE),
              icon: Icon(Icons.person))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              color: Colors.blue,
              child: Text(
                "DASHBOARD MENU",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            Expanded(
              child: controller.levelValue == "admin"
                  ? ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ListTile(
                          onTap: () => Get.offNamed(Routes.HOME,
                              arguments: controller.levelValue),
                          leading: Icon(Icons.home),
                          title: Text("Home"),
                        ),
                        ListTile(
                          onTap: () => Get.offNamed(Routes.USER,
                              arguments: controller.levelValue),
                          leading: Icon(Icons.people),
                          title: Text("User"),
                        ),
                        ListTile(
                          onTap: () => Get.offNamed(Routes.JEMAAT,
                              arguments: controller.levelValue),
                          leading: Icon(Icons.book),
                          title: Text("Jemaat"),
                        ),
                        ListTile(
                          onTap: () => Get.offNamed(Routes.JADWAL_PELAYANAN,
                              arguments: controller.levelValue),
                          leading: Icon(Icons.calendar_month),
                          title: Text("Jadwal Pelayanan"),
                        ),
                      ],
                    )
                  : ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ListTile(
                          onTap: () => Get.offNamed(Routes.HOME,
                              arguments: controller.levelValue),
                          leading: Icon(Icons.home),
                          title: Text("Home"),
                        ),
                        ListTile(
                          onTap: () => Get.offNamed(Routes.JADWAL_PELAYANAN,
                              arguments: controller.levelValue),
                          leading: Icon(Icons.calendar_month),
                          title: Text("Jadwal Pelayanan"),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamJadwalPelayanan(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data?.docs.length == 0 || snapshot.data == null) {
              return Center(
                child: Text('Belum ada data Jadwal Pelayanan'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var docJadwalPelayanan = snapshot.data!.docs[index];
                Map<String, dynamic> jadwalPelayanan =
                    docJadwalPelayanan.data();
                return Card(
                  child: ListTile(
                    onTap: () {
                      if (controller.levelValue == "admin") {
                        Get.toNamed(Routes.JADWAL_PELAYANAN_DETAILS,
                            arguments: docJadwalPelayanan.id);
                      }
                    },
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text("${jadwalPelayanan['nama_ibadah']}"),
                    subtitle: Text(
                        "${DateFormat.yMMMd().format(DateTime.parse(jadwalPelayanan['tanggal_ibadah']))} - ${jadwalPelayanan['waktu_ibadah']}"),
                    trailing: controller.levelValue == "admin"
                        ? jadwalPelayanan['jumlah_hadir'] == null
                            ? IconButton(
                                onPressed: () {
                                  controller.deleteJadwalPelayanan(
                                      docJadwalPelayanan.id,
                                      jadwalPelayanan['uid']);
                                },
                                icon: Icon(Icons.delete),
                              )
                            : null
                        : null,
                    // trailing: IconButton(
                    //     onPressed: () => Get.toNamed(Routes.JEMAAT_EDIT,
                    //         arguments: docJemaat.id),
                    //     icon: Icon(Icons.edit)),
                  ),
                );
              },
            );
          }),
      floatingActionButton: controller.levelValue == "admin"
          ? FloatingActionButton(
              onPressed: () => Get.toNamed(Routes.JADWAL_PELAYANAN_ADD),
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
