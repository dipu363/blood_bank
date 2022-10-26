
import 'package:blood_bank/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../utils/AppNameStyle.dart';
import '../utils/TextStore.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool visibleProgressBar = true;
  final SplashController splashController = Get.put(SplashController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashController.initData(context);
  }

  @override
  Widget build(BuildContext context) {

    var textStyle = TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 5.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      child: Image.asset(
                        TextStore.img_ministry_logo,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      TextStore.splash_name_en,
                      style: textStyle,
                    ),
                    Text(
                      TextStore.splash_name_ar,
                      style: textStyle,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppNameStyle(
                      text1: TextStore.splash_moto1_en,
                      text2: TextStore.splash_moto2_en,
                    ),
                    AppNameStyle(
                      text1: TextStore.splash_moto1_ar,
                      text2: "",
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: 300,
                      height: 100,
                      child: Image.asset(
                        TextStore.img_blood_bank,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: <Widget>[
                      Visibility(
                        visible: visibleProgressBar,
                        child: const CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(TextStore.appVersion),
                      const SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        child: Image.asset(
                          TextStore.img_medisys_logo,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
