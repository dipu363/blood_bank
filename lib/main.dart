import 'package:blood_bank/screen/splash_screen.dart';
import 'package:blood_bank/utils/TextStore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const BloodBank());
}

class BloodBank extends StatelessWidget {
  const BloodBank({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appColor = const Color(0xffB40404);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: TextStore.appName,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: const Color(0xff3B8B83),
        primaryColor: appColor,
        secondaryHeaderColor: appColor,
      ),
      home: const SplashScreen(),
    );
  }
}

