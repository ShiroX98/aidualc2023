import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jemaat_add_controller.dart';
import 'package:intl/intl.dart';

class JemaatAddView extends GetView<JemaatAddController> {
  List<DropdownMenuItem> jemaatItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TAMBAH JEMAAT'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.namaC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              labelText: "Nama Jemaat",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.asalC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              labelText: "Asal Jemaat",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.tempatLahirC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              labelText: "Tempat Lahir Jemaat",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Tanggal Lahir"),
          SizedBox(
            height: 10,
          ),
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
                            .format(controller.tanggalLahir.value)
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
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.alamatC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              labelText: "Alamat Jemaat",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.notlpC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              labelText: "No Telp Jemaat",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.pekerjaanC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              labelText: "Pekerjaan Jemaat",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
              // showSearchBox: true,
            ),
            items: ["Laki-laki", "Perempuan"],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  labelText: "Jenis Kelamin",
                  // hintText: "country in menu mode",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
            onChanged: (value) {
              controller.pilihJenisKelamin(value);
            },
            selectedItem: "Laki-laki",
          ),
          SizedBox(
            height: 20,
          ),
          // TextField(
          //   controller: controller.statusJemaatC,
          //   autocorrect: false,
          //   textInputAction: TextInputAction.next,
          //   decoration: InputDecoration(
          //     contentPadding:
          //         EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          //     labelText: "Status Jemaat",
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(50),
          //     ),
          //     prefixIcon: Icon(Icons.person),
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // TextField(
          //   controller: controller.statusPelayananC,
          //   autocorrect: false,
          //   textInputAction: TextInputAction.next,
          //   decoration: InputDecoration(
          //     contentPadding:
          //         EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          //     labelText: "Status Pelayanan",
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(50),
          //     ),
          //     prefixIcon: Icon(Icons.person),
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          TextField(
            controller: controller.emailC,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // Obx(
          //   () => TextField(
          //     controller: controller.passC,
          //     autocorrect: false,
          //     obscureText: controller.isHidden.value,
          //     textInputAction: TextInputAction.done,
          //     decoration: InputDecoration(
          //         contentPadding:
          //             EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          //         labelText: "Password",
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(50),
          //         ),
          //         prefixIcon: Icon(Icons.vpn_key),
          //         suffixIcon: IconButton(
          //             onPressed: () => controller.isHidden.toggle(),
          //             icon: Icon(controller.isHidden.isTrue
          //                 ? Icons.remove_red_eye
          //                 : Icons.remove_red_eye_outlined))),
          //   ),
          // ),
          SizedBox(
            height: 50,
          ),
          Obx(() => ElevatedButton(
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    controller.jemaatAdd();
                  }
                },
                child: Text(controller.isLoading.isFalse
                    ? "TAMBAH JEMAAT"
                    : "Loading..."),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
