

import 'package:blood_bank/utils/ApplicationMemory.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../data/application_api.dart';
import '../data/responseModel/CommonResponse.dart';
import '../screen/login_screen.dart';
import '../utils/AppUtils.dart';

class HomeController extends GetxController{
  static String key = 'HomeController.';


  /*property*/

  var nationalId = "".obs;
  var phoneNo = "".obs;
  var patNo = "".obs;
  var fullName = "".obs;

  /*stage*/
  var currentStage = 0.obs;


  @override
  void onInit() {
    super.onInit();
    initData();

  }

  void initData() async {

    var nid = await ApplicationMemory.getString(ApplicationMemory.KEY_NID);
    var phone = await ApplicationMemory.getString(ApplicationMemory.KEY_MOBILE_NO);
    var pNo = await ApplicationMemory.getString(ApplicationMemory.KEY_PAT_NO);
    var fName = await ApplicationMemory.getString(ApplicationMemory.KEY_FULL_NAME_EN);
    var cStage = await ApplicationMemory.getString(ApplicationMemory.KEY_CURRENT_STAGE);


      nationalId.value = nid;
      phoneNo.value = phone;
      patNo.value = pNo ?? "";
      fullName.value = fName ?? "";
      currentStage.value= int.parse(cStage ?? "1");



    if (await AppUtils.checkConnection()) {
      _checkCurrentStage(Get.context);
    }
  }



  /*================= CALL BACK =====================*/
  void  logout(){
    ApplicationMemory.removeValues(ApplicationMemory.KEY_NID); //for logout
    ApplicationMemory.removeValues(ApplicationMemory.KEY_MOBILE_NO); //for logout
    ApplicationMemory.removeValues(ApplicationMemory.KEY_FULL_NAME_EN); //for logout
    ApplicationMemory.removeValues(ApplicationMemory.KEY_FULL_NAME_AR); //for logout
    ApplicationMemory.removeValues(ApplicationMemory.KEY_PAT_NO); //for logout
    ApplicationMemory.removeValues(ApplicationMemory.KEY_CURRENT_STAGE); //for logout
    Get.offAll(const LoginScreen());
  }
  /*================= API =====================*/


  void _checkCurrentStage(context) async{
   // ApplicationLoader.apiRequestLoader(context);
    CommonResponse res = await ApplicationApi(context).checkCurrentStage(nationalId.value, phoneNo.value);
    if(res.success){
      if (kDebugMode) {
        print('$key :: _checkCurrentStage = ${res.data}');
      }
      ApplicationMemory.putString(ApplicationMemory.KEY_CURRENT_STAGE, res.data);
      currentStage.value = int.parse(res.data);
    }
  }
}