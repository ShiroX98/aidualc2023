import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app/routes/app_pages.dart';
import 'app/modules/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth auth = FirebaseAuth.instance;

  runApp(
    StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          return GetMaterialApp(
            title: "Application",
            initialRoute: snap.data != null && snap.data?.emailVerified == true
                ? Routes.HOME
                : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }),
  );
}
