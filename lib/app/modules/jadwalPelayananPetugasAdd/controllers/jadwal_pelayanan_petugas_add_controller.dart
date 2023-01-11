import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';
import 'package:get/get.dart';

class JadwalPelayananPetugasAddController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  final jadwalUID = Get.arguments.toString();
  var wl = "".obs;
  var uidwl = "".obs;
  var lcd = "".obs;
  var uidlcd = "".obs;
  var asher1 = "".obs;
  var uidasher1 = "".obs;
  var asher2 = "".obs;
  var uidasher2 = "".obs;
  var singers1 = "".obs;
  var uidsingers1 = "".obs;
  var singers2 = "".obs;
  var uidsingers2 = "".obs;
  var singers3 = "".obs;
  var uidsingers3 = "".obs;
  var music1 = "".obs;
  var uidmusic1 = "".obs;
  var music2 = "".obs;
  var uidmusic2 = "".obs;
  var music3 = "".obs;
  var uidmusic3 = "".obs;
  var tamborine1 = "".obs;
  var uidtamborine1 = "".obs;
  var tamborine2 = "".obs;
  var uidtamborine2 = "".obs;
  var tamborine3 = "".obs;
  var uidtamborine3 = "".obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //! Controll WL
  Future<Map<String, dynamic>?> getJemaatByIDforWL(dynamic docID) async {
    // try {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection("jemaats").doc(docID[0]['first']).get();
    Map<String, dynamic>? jemaat = doc.data();
    if (docID[1]['second'] == "WL") {
      if (wl.isEmpty) {
        wl.value = jemaat?['nama_jemaat'];
        uidwl.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      }
    }
    print("${jadwalUID}");

    return null;
  }

  void hapusWL() async {
    if (wl.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidwl.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      wl.value = "";
      uidwl.value = "";
    }
  }

  //! End Controll WL
  //! Controll LCD
  Future<Map<String, dynamic>?> getJemaatByIDforLCD(dynamic docID) async {
    // try {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection("jemaats").doc(docID[0]['first']).get();
    Map<String, dynamic>? jemaat = doc.data();
    if (docID[1]['second'] == "LCD") {
      if (lcd.isEmpty) {
        lcd.value = jemaat?['nama_jemaat'];
        uidlcd.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      }
    }
    // print(docID[1]['second']);
    // print("WL adalah ${wl1.value}, ${wl2.value}, ${wl2.value}");
    // Get.offNamed(Routes.JADWAL_PELAYANAN_ADD);
    // } catch (e) {
    //   print(e);
    // }
    return null;
  }

  void hapusLCD() async {
    if (lcd.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidlcd.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      lcd.value = "";
      uidlcd.value = "";
    }
  }

  //! End Controll LCD
  //! Controll Asher
  Future<Map<String, dynamic>?> getJemaatByIDforAsher(dynamic docID) async {
    // try {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection("jemaats").doc(docID[0]['first']).get();
    Map<String, dynamic>? jemaat = doc.data();
    if (docID[1]['second'] == 'Asher') {
      if (asher1.isEmpty) {
        asher1.value = jemaat?['nama_jemaat'];
        uidasher1.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      } else if (asher2.isEmpty) {
        asher2.value = jemaat?['nama_jemaat'];
        uidasher2.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      }
    }
    return null;
  }

  void hapusAsher() async {
    if (asher2.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidasher2.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      asher2.value = "";
      uidasher2.value = "";
    }
    if (asher1.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidasher1.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      asher1.value = "";
      uidasher1.value = "";
    }
  }

  //! End Controll Asher
  //! Controll Singers
  Future<Map<String, dynamic>?> getJemaatByIDforSingers(dynamic docID) async {
    // try {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection("jemaats").doc(docID[0]['first']).get();
    Map<String, dynamic>? jemaat = doc.data();
    if (docID[1]['second'] == 'Singers') {
      if (singers1.isEmpty) {
        singers1.value = jemaat?['nama_jemaat'];
        uidsingers1.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      } else if (singers2.isEmpty) {
        singers2.value = jemaat?['nama_jemaat'];
        uidsingers2.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      } else if (singers3.isEmpty) {
        singers3.value = jemaat?['nama_jemaat'];
        uidsingers3.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      }
    }
    // print(
    //     "Singers adalah ${singers1.value}, ${singers2.value}, ${singers3.value}");
    // Get.offNamed(Routes.JADWAL_PELAYANAN_ADD);
    // } catch (e) {
    //   print(e);
    // }
    return null;
  }

  void hapusSingers() async {
    if (singers3.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidsingers3.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      singers3.value = "";
      uidsingers3.value = "";
    }
    if (singers2.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidsingers2.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      singers2.value = "";
      uidsingers2.value = "";
    }
    if (singers1.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidsingers1.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      singers1.value = "";
      uidsingers1.value = "";
    }
  }

  //! End Controll Singers
  //! Controll Music
  Future<Map<String, dynamic>?> getJemaatByIDforMusic(dynamic docID) async {
    // try {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection("jemaats").doc(docID[0]['first']).get();
    Map<String, dynamic>? jemaat = doc.data();
    if (docID[1]['second'] == 'Music') {
      if (music1.isEmpty) {
        music1.value = jemaat?['nama_jemaat'];
        uidmusic1.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      } else if (music2.isEmpty) {
        music2.value = jemaat?['nama_jemaat'];
        uidmusic2.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      } else if (music3.isEmpty) {
        music3.value = jemaat?['nama_jemaat'];
        uidmusic3.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      }
    }
    return null;
  }

  void hapusMusic() async {
    if (music3.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidmusic3.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      music3.value = "";
      uidmusic3.value = "";
    }
    if (music2.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidmusic2.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      music2.value = "";
      uidmusic2.value = "";
    }
    if (music1.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidmusic1.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      music1.value = "";
      uidmusic1.value = "";
    }
  }

  //! End Controll Music
  //! Controll Tamborine
  Future<Map<String, dynamic>?> getJemaatByIDforTamborine(dynamic docID) async {
    // try {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection("jemaats").doc(docID[0]['first']).get();
    Map<String, dynamic>? jemaat = doc.data();
    if (docID[1]['second'] == 'Tamborine') {
      if (tamborine1.isEmpty) {
        tamborine1.value = jemaat?['nama_jemaat'];
        uidtamborine1.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      } else if (tamborine2.isEmpty) {
        tamborine2.value = jemaat?['nama_jemaat'];
        uidtamborine2.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      } else if (tamborine3.isEmpty) {
        tamborine3.value = jemaat?['nama_jemaat'];
        uidtamborine3.value = jemaat?['uid'];
        await firestore
            .collection("jemaats")
            .doc(docID[0]['first'])
            .update({"status_pelayanan": "Loading"});
      }
    }
    return null;
  }

  void hapusTamborine() async {
    if (tamborine3.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidtamborine3.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      tamborine3.value = "";
      uidtamborine3.value = "";
    }
    if (tamborine2.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidtamborine2.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      tamborine2.value = "";
      uidtamborine2.value = "";
    }
    if (tamborine1.isNotEmpty) {
      try {
        await firestore
            .collection("jemaats")
            .doc(uidtamborine1.value.toString())
            .update({"status_pelayanan": "Tidak Aktif"});
      } catch (e) {
        print(e);
      }
      tamborine1.value = "";
      uidtamborine1.value = "";
    }
  }
  //! End Controll Tamborine

  void resetAllStatusJemaat() async {
    hapusWL();
    hapusLCD();
    for (var i = 0; i < 2; i++) {
      hapusAsher();
    }
    for (var i = 0; i < 3; i++) {
      hapusSingers();
    }
    for (var i = 0; i < 3; i++) {
      hapusMusic();
    }
    for (var i = 0; i < 3; i++) {
      hapusTamborine();
    }
  }

  void batalAddPelayanan() async {
    isLoading.value = true;
    resetAllStatusJemaat();

    isLoading.value = false;
    Get.offAllNamed(Routes.JADWAL_PELAYANAN);
  }

  void simpanPelayanan() async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection("jadwal_pelayanans").doc(jadwalUID).get();
    Map<String, dynamic>? jadwalPelayanan = doc.data();
    if (wl.value.isNotEmpty &&
        asher1.value.isNotEmpty &&
        lcd.value.isNotEmpty &&
        singers1.value.isNotEmpty &&
        music1.value.isNotEmpty &&
        tamborine1.value.isNotEmpty) {
      try {
        isLoading.value = true;
        //! Store WL
        await firestore
            .collection("jadwal_pelayanans")
            .doc(jadwalUID)
            .collection("petugas_pelayanans")
            .add({
          "jemaat_uid": uidwl.value,
          "nama_jemaat": wl.value,
          "petugas": "WL",
          "createdAt": DateTime.now().toIso8601String(),
        });

        await firestore
            .collection("jemaats")
            .doc(uidwl.value)
            .collection("riwayat_petugas")
            .add({
          "pelayanan_uid": doc.id,
          "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
          "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
          "petugas": "WL",
        });
        //! End Store WL
        //! Store LCD
        await firestore
            .collection("jadwal_pelayanans")
            .doc(jadwalUID)
            .collection("petugas_pelayanans")
            .add({
          "jemaat_uid": uidlcd.value,
          "nama_jemaat": lcd.value,
          "petugas": "LCD",
          "createdAt": DateTime.now().toIso8601String(),
        });

        await firestore
            .collection("jemaats")
            .doc(uidlcd.value)
            .collection("riwayat_petugas")
            .add({
          "pelayanan_uid": doc.id,
          "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
          "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
          "petugas": "LCD",
        });
        //! End Store LCD
        //! Store Asher
        await firestore
            .collection("jadwal_pelayanans")
            .doc(jadwalUID)
            .collection("petugas_pelayanans")
            .add({
          "jemaat_uid": uidasher1.value,
          "nama_jemaat": asher1.value,
          "petugas": "Asher",
          "createdAt": DateTime.now().toIso8601String(),
        });

        await firestore
            .collection("jemaats")
            .doc(uidasher1.value)
            .collection("riwayat_petugas")
            .add({
          "pelayanan_uid": doc.id,
          "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
          "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
          "petugas": "Asher",
        });
        if (uidasher2.value.isNotEmpty) {
          await firestore
              .collection("jadwal_pelayanans")
              .doc(jadwalUID)
              .collection("petugas_pelayanans")
              .add({
            "jemaat_uid": uidasher2.value,
            "nama_jemaat": asher2.value,
            "petugas": "Asher",
            "createdAt": DateTime.now().toIso8601String(),
          });
          await firestore
              .collection("jemaats")
              .doc(uidasher2.value)
              .collection("riwayat_petugas")
              .add({
            "pelayanan_uid": doc.id,
            "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
            "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
            "petugas": "Asher",
          });
        }
        //! End Store Asher
        //! Store Singer
        await firestore
            .collection("jadwal_pelayanans")
            .doc(jadwalUID)
            .collection("petugas_pelayanans")
            .add({
          "jemaat_uid": uidsingers1.value,
          "nama_jemaat": singers1.value,
          "petugas": "Singer",
          "createdAt": DateTime.now().toIso8601String(),
        });

        await firestore
            .collection("jemaats")
            .doc(uidsingers1.value)
            .collection("riwayat_petugas")
            .add({
          "pelayanan_uid": doc.id,
          "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
          "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
          "petugas": "Singer",
        });
        if (uidsingers2.value.isNotEmpty) {
          await firestore
              .collection("jadwal_pelayanans")
              .doc(jadwalUID)
              .collection("petugas_pelayanans")
              .add({
            "jemaat_uid": uidsingers2.value,
            "nama_jemaat": singers2.value,
            "petugas": "Singer",
            "createdAt": DateTime.now().toIso8601String(),
          });
          await firestore
              .collection("jemaats")
              .doc(uidsingers2.value)
              .collection("riwayat_petugas")
              .add({
            "pelayanan_uid": doc.id,
            "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
            "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
            "petugas": "Singer",
          });
        }
        if (uidsingers3.value.isNotEmpty) {
          await firestore
              .collection("jadwal_pelayanans")
              .doc(jadwalUID)
              .collection("petugas_pelayanans")
              .add({
            "jemaat_uid": uidsingers3.value,
            "nama_jemaat": singers3.value,
            "petugas": "Singer",
            "createdAt": DateTime.now().toIso8601String(),
          });
          await firestore
              .collection("jemaats")
              .doc(uidsingers3.value)
              .collection("riwayat_petugas")
              .add({
            "pelayanan_uid": doc.id,
            "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
            "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
            "petugas": "Singer",
          });
        }
        //! End Store Singer
        //! Store Music
        await firestore
            .collection("jadwal_pelayanans")
            .doc(jadwalUID)
            .collection("petugas_pelayanans")
            .add({
          "jemaat_uid": uidmusic1.value,
          "nama_jemaat": music1.value,
          "petugas": "Music",
          "createdAt": DateTime.now().toIso8601String(),
        });
        await firestore
            .collection("jemaats")
            .doc(uidmusic1.value)
            .collection("riwayat_petugas")
            .add({
          "pelayanan_uid": doc.id,
          "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
          "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
          "petugas": "Music",
        });
        if (uidmusic2.value.isNotEmpty) {
          await firestore
              .collection("jadwal_pelayanans")
              .doc(jadwalUID)
              .collection("petugas_pelayanans")
              .add({
            "jemaat_uid": uidmusic2.value,
            "nama_jemaat": music2.value,
            "petugas": "Music",
            "createdAt": DateTime.now().toIso8601String(),
          });
          await firestore
              .collection("jemaats")
              .doc(uidmusic2.value)
              .collection("riwayat_petugas")
              .add({
            "pelayanan_uid": doc.id,
            "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
            "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
            "petugas": "Music",
          });
        }
        if (uidmusic3.value.isNotEmpty) {
          await firestore
              .collection("jadwal_pelayanans")
              .doc(jadwalUID)
              .collection("petugas_pelayanans")
              .add({
            "jemaat_uid": uidmusic3.value,
            "nama_jemaat": music3.value,
            "petugas": "Music",
            "createdAt": DateTime.now().toIso8601String(),
          });
          await firestore
              .collection("jemaats")
              .doc(uidmusic3.value)
              .collection("riwayat_petugas")
              .add({
            "pelayanan_uid": doc.id,
            "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
            "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
            "petugas": "Music",
          });
        }
        //! End Store Music
        //! Store Tamborine
        await firestore
            .collection("jadwal_pelayanans")
            .doc(jadwalUID)
            .collection("petugas_pelayanans")
            .add({
          "jemaat_uid": uidtamborine1.value,
          "nama_jemaat": tamborine1.value,
          "petugas": "Tamborine",
          "createdAt": DateTime.now().toIso8601String(),
        });
        await firestore
            .collection("jemaats")
            .doc(uidtamborine1.value)
            .collection("riwayat_petugas")
            .add({
          "pelayanan_uid": doc.id,
          "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
          "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
          "petugas": "Tamborine",
        });
        if (uidtamborine2.value.isNotEmpty) {
          await firestore
              .collection("jadwal_pelayanans")
              .doc(jadwalUID)
              .collection("petugas_pelayanans")
              .add({
            "jemaat_uid": uidtamborine2.value,
            "nama_jemaat": tamborine2.value,
            "petugas": "Tamborine",
            "createdAt": DateTime.now().toIso8601String(),
          });
          await firestore
              .collection("jemaats")
              .doc(uidtamborine2.value)
              .collection("riwayat_petugas")
              .add({
            "pelayanan_uid": doc.id,
            "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
            "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
            "petugas": "Tamborine",
          });
        }
        if (uidtamborine3.value.isNotEmpty) {
          await firestore
              .collection("jadwal_pelayanans")
              .doc(jadwalUID)
              .collection("petugas_pelayanans")
              .add({
            "jemaat_uid": uidtamborine3.value,
            "nama_jemaat": tamborine3.value,
            "petugas": "Tamborine",
            "createdAt": DateTime.now().toIso8601String(),
          });
          await firestore
              .collection("jemaats")
              .doc(uidtamborine2.value)
              .collection("riwayat_petugas")
              .add({
            "pelayanan_uid": doc.id,
            "nama_pelayanan": jadwalPelayanan?['nama_ibadah'],
            "tanggal_pelayanan": jadwalPelayanan?['tanggal_ibadah'],
            "petugas": "Tamborine",
          });
        }
        //! End Store Tamborine

        resetAllStatusJemaat();
        isLoading.value = false;
        Get.offNamed(Routes.JADWAL_PELAYANAN);
      } catch (e) {
        isLoading.value = false;
        print(e);
        Get.snackbar(
            "TERJADI KESALAHAN", "Tidak dapat menyimpan jadwal pelayanan.");
      }
    } else {
      Get.snackbar("TERJADI KESALAHAN", "Semua peran petugas harus diisi.");
    }
  }
}
