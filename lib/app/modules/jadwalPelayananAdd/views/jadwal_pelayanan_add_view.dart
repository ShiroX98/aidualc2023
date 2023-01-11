import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/jadwal_pelayanan_add_controller.dart';

class JadwalPelayananAddView extends GetView<JadwalPelayananAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TAMBAH JADWAL'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              // showSearchBox: true,
            ),
            items: ["Doa Pagi", "Doa Worship", "Ibadah Raya", "Ibadah Youth"],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  labelText: "Nama Ibadah",
                  // hintText: "country in menu mode",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
            onChanged: (value) {
              controller.pilihNamaIbadah(value);
            },
            selectedItem: controller.namaIbadah,
          ),
          SizedBox(
            height: 20,
          ),
          //! Box Pilih Tanggal
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Obx(
                      () => Text(
                        DateFormat("dd-MM-yyyy")
                            .format(controller.tanggalIbadah.value)
                            .toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.pilihTanggal();
                      },
                      child: Text("Pilih Tanggal"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //! End Box Pilih Tanggal
          //! Box Pilih Waktu
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.more_time,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Obx(
                      () => Text(
                        "${controller.waktuIbadah.value.hour}:${controller.waktuIbadah.value.minute}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.pilihWaktu();
                      },
                      child: Text("Pilih Waktu"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //! End Box Pilih Waktu
          //! Box WL
          Container(
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Worship Lead",
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (controller.wl.isEmpty) {
                                    Get.toNamed(Routes.WORSHIP_LEAD_ADD);
                                  }
                                },
                                icon: Icon(Icons.add)),
                            IconButton(
                                onPressed: () {
                                  controller.hapusWL();
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                FutureBuilder<Map<String, dynamic>?>(
                  future: controller.getJemaatByIDforWL(Get.arguments),
                  builder: (context, snapshot) {
                    return Obx(
                      () => Column(
                        children: <Widget>[
                          Text("${controller.wl}"),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //! End Box WL
          //! Box LCD
          Container(
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "LCD",
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (controller.lcd.isEmpty) {
                                    Get.toNamed(Routes.LCD_ADD);
                                  }
                                },
                                icon: Icon(Icons.add)),
                            IconButton(
                                onPressed: () {
                                  controller.hapusLCD();
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                FutureBuilder<Map<String, dynamic>?>(
                  future: controller.getJemaatByIDforLCD(Get.arguments),
                  builder: (context, snapshot) {
                    return Obx(
                      () => Column(
                        children: <Widget>[
                          Text("${controller.lcd}"),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //! End Box LCD
          //! Box Asher
          Container(
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Asher",
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (controller.asher2.isEmpty) {
                                    Get.toNamed(Routes.ASHER_ADD);
                                  }
                                },
                                icon: Icon(Icons.add)),
                            IconButton(
                                onPressed: () {
                                  controller.hapusAsher();
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                FutureBuilder<Map<String, dynamic>?>(
                  future: controller.getJemaatByIDforAsher(Get.arguments),
                  builder: (context, snapshot) {
                    return Obx(
                      () => Column(
                        children: <Widget>[
                          Text("${controller.asher1}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("${controller.asher2}"),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //! End Box Asher
          //! Box Singers
          Container(
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Singers",
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (controller.singers3.isEmpty) {
                                    Get.toNamed(Routes.SINGERS_ADD);
                                  }
                                },
                                icon: Icon(Icons.add)),
                            IconButton(
                                onPressed: () {
                                  controller.hapusSingers();
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                FutureBuilder<Map<String, dynamic>?>(
                  future: controller.getJemaatByIDforSingers(Get.arguments),
                  builder: (context, snapshot) {
                    return Obx(
                      () => Column(
                        children: <Widget>[
                          Text("${controller.singers1}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("${controller.singers2}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("${controller.singers3}"),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //! End Box Singers
          //! Box Music
          Container(
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Music",
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (controller.music3.isEmpty) {
                                    Get.toNamed(Routes.MUSIC_ADD);
                                  }
                                },
                                icon: Icon(Icons.add)),
                            IconButton(
                                onPressed: () {
                                  controller.hapusMusic();
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                FutureBuilder<Map<String, dynamic>?>(
                  future: controller.getJemaatByIDforMusic(Get.arguments),
                  builder: (context, snapshot) {
                    return Obx(
                      () => Column(
                        children: <Widget>[
                          Text("${controller.music1}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("${controller.music2}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("${controller.music3}"),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //! End Box Music
          //! Box Tamborine
          Container(
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Tamborine",
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (controller.tamborine3.isEmpty) {
                                    Get.toNamed(Routes.TAMBORINE_ADD);
                                  }
                                },
                                icon: Icon(Icons.add)),
                            IconButton(
                                onPressed: () {
                                  controller.hapusTamborine();
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                FutureBuilder<Map<String, dynamic>?>(
                  future: controller.getJemaatByIDforTamborine(Get.arguments),
                  builder: (context, snapshot) {
                    return Obx(
                      () => Column(
                        children: <Widget>[
                          Text("${controller.tamborine1}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("${controller.tamborine2}"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("${controller.tamborine3}"),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //! End Box Tamborine
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(() => ElevatedButton(
                    onPressed: () {
                      if (controller.isLoading.isFalse) {
                        controller.batalAddPelayanan();
                      }
                    },
                    child: Text(
                        controller.isLoading.isFalse ? "BATAL" : "Loading..."),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  )),
              SizedBox(
                width: 10,
              ),
              Obx(() => ElevatedButton(
                    onPressed: () {
                      if (controller.isLoading.isFalse) {
                        controller.simpanPelayanan();
                      }
                    },
                    child: Text(
                        controller.isLoading.isFalse ? "SIMPAN" : "Loading..."),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
