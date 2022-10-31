

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../screen/home_screen.dart';
import '../screen/login_screen.dart';
import '../utils/AppUtils.dart';
import '../utils/ApplicationMemory.dart';
import '../utils/CommonLabel.dart';
import '../utils/dialog/AppToast.dart';

class SplashController extends GetxController{

  void initData(BuildContext context){
    // CommonLabel(context);
    Future.delayed(const Duration(milliseconds: 5000), () async{
       var nid = await ApplicationMemory.getString(ApplicationMemory.KEY_NID);
       var mobileNo = await ApplicationMemory.getString(ApplicationMemory.KEY_MOBILE_NO);
      debugPrint(nid);
      if(await AppUtils.checkConnection()){
        /*load common label*/
        await CommonLabel.initList(context);
        var nextScreen = nid == null || mobileNo == null ? const LoginScreen() : const HomeScreen() ;
        Get.off(() => nextScreen);

      }else{
        AppToast(context).showToast(CommonLabel.commonCheckConnection, AppToast.ERROR, AppToast.LONG);

      }
    });
  }

}