import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
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
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
