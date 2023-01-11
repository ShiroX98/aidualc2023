import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/jemaat_edit_controller.dart';

class JemaatEditView extends GetView<JemaatEditController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JemaatEditView'),
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
              controller.jenisKelamin = snapshot.data!["gender_jemaat"];
              controller.tanggalLahir.value =
                  DateTime.parse(snapshot.data!["tanggal_lahir_jemaat"]);
              controller.namaC.text = snapshot.data!["nama_jemaat"];
              controller.asalC.text = snapshot.data!["asal_jemaat"];
              controller.tempatLahirC.text =
                  snapshot.data!["tempat_lahir_jemaat"];
              controller.alamatC.text = snapshot.data!["alamat_jemaat"];
              controller.notlpC.text = snapshot.data!["notelp_jemaat"];
              controller.pekerjaanC.text = snapshot.data!["pekerjaan_jemaat"];
              controller.genderC.text = snapshot.data!["gender_jemaat"];
              controller.statusJemaatC.text = snapshot.data!["status_jemaat"];
            }
            return ListView(
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
                // TextField(
                //   controller: controller.tanggalLahirC,
                //   autocorrect: false,
                //   textInputAction: TextInputAction.next,
                //   decoration: InputDecoration(
                //     contentPadding:
                //         EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                //     labelText: "Tanggal Lahir",
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(50),
                //     ),
                //     prefixIcon: Icon(Icons.calendar_today_rounded),
                //   ),
                //   onTap: () async {
                //     DateTime? pickeddate = await showDatePicker(
                //             context: context,
                //             initialDate: DateTime.now(),
                //             firstDate: DateTime(1945),
                //             lastDate: DateTime(2100))
                //         .then((value) {
                //       if (value != null) {
                //         controller.tanggalLahir.value = value;
                //       }
                //     });
                //   },
                // ),
                // SizedBox(
                //   height: 20,
                // ),
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
                      SizedBox(
                        width: 100,
                      ),
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
                    showSearchBox: true,
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
                  selectedItem: controller.jenisKelamin,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller.statusJemaatC,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    labelText: "Status Jemaat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() => ElevatedButton(
                      onPressed: () {
                        if (controller.isLoading.isFalse) {
                          controller.jemaatEdit(Get.arguments.toString());
                        }
                      },
                      child: Text(controller.isLoading.isFalse
                          ? "EDIT JEMAAT"
                          : "Loading..."),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    )),
              ],
            );
          }),
    );
  }
}
