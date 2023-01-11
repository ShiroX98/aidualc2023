import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/jemaat_controller.dart';

class JemaatView extends GetView<JemaatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JEMAAT'),
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
                return Card(
                  child: ListTile(
                    onTap: () => Get.toNamed(Routes.JEMAAT_DETAIL,
                        arguments: docJemaat.id),
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text("${jemaat['nama_jemaat']}"),
                    subtitle: Text("${jemaat['email']}"),

                    // trailing: IconButton(
                    //   onPressed: () {
                    //     controller.deleteJemaat(docJemaat.id, jemaat['uid']);
                    //   },
                    //   icon: Icon(Icons.delete),
                    // ),
                    trailing: IconButton(
                        onPressed: () => Get.toNamed(Routes.JEMAAT_EDIT,
                            arguments: docJemaat.id),
                        icon: Icon(Icons.edit)),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.JEMAAT_ADD),
        child: Icon(Icons.add),
      ),
    );
  }
}
