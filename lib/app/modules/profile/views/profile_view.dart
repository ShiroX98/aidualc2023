import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFILE'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.logout(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: controller.getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return Center(
              child: Text("Tidak ada data user."),
            );
          } else {
            controller.emailC.text = snapshot.data!["email"];
            controller.nameC.text = snapshot.data!["name"];
            controller.phoneC.text = snapshot.data!["notelp"];
            return ListView(
              padding: EdgeInsets.all(20),
              children: [
                TextField(
                  controller: controller.nameC,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controller.phoneC,
                  autocorrect: false,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  readOnly: true,
                  controller: controller.emailC,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => TextField(
                    obscureText: controller.isHidden.value,
                    controller: controller.passC,
                    autocorrect: false,
                    decoration: InputDecoration(
                        labelText: "New Password",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () => controller.isHidden.toggle(),
                            icon: Icon(controller.isHidden.isFalse
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined))),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Created At :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                    "${DateFormat.yMMMEd().add_jms().format(DateTime.parse(snapshot.data!["createdAt"]))}"),
                SizedBox(height: 40),
                Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      if (controller.isLoading.isFalse) {
                        controller.updateProfile();
                      }
                    },
                    child: Text(controller.isLoading.isFalse
                        ? "UPDATE PROFILE"
                        : "LOADING..."),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
