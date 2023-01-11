import 'package:flutter/material.dart';
import 'package:flutter_claudia/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    if (box.read("rememberMe") != null) {
      controller.emailC.text = box.read("rememberMe")["email"];
      controller.passC.text = box.read("rememberMe")["pass"];
      controller.rememberMe.value = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
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
          SizedBox(
            height: 20,
          ),
          Obx(
            () => TextField(
              controller: controller.passC,
              autocorrect: false,
              obscureText: controller.isHidden.value,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(Icons.vpn_key),
                  suffixIcon: IconButton(
                      onPressed: () => controller.isHidden.toggle(),
                      icon: Icon(controller.isHidden.isTrue
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined))),
            ),
          ),
          Obx(
            () => CheckboxListTile(
              value: controller.rememberMe.value,
              onChanged: (_) => controller.rememberMe.toggle(),
              title: Text("remember me"),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 150,
                child: TextButton(
                    onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                    child: Text("forgot password ?")),
              ),
              
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() => ElevatedButton(
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    controller.login();
                  }
                },
                child:
                    Text(controller.isLoading.isFalse ? "LOGIN" : "Loading..."),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )),
          TextButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),
              child: Text("Register")),
        ],
      ),
    );
  }
}
