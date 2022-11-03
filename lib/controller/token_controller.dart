
import 'package:blood_bank/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/application_api.dart';
import '../data/responseModel/CommonResponse.dart';
import '../utils/ApplicationMemory.dart';
import '../utils/CommonLabel.dart';
import '../utils/LabelConstant.dart';
import '../utils/TextStore.dart';
import '../utils/dialog/AppDialog.dart';
import '../utils/dialog/ApplicationLoader.dart';

class TokenController extends GetxController{
  final String KEY = 'TokenController';
  var tokenKey = GlobalKey<FormState>();
  TextEditingController textToken = TextEditingController();
  var isLocalActive = true.obs;
  var loginLblActivationCode = "".obs;
  var loginLblEnterActivationCode = "".obs;
  var loginLblVerify = "".obs;

  //2421372422 user id
  //0559355184 password

  void initData(context,labelList) async {
    String lang = await ApplicationMemory.getString(ApplicationMemory.KEY_LANGUAGE);
      isLocalActive.value = lang !=  TextStore.common_lang_english ? true : false;

   // await CommonLabel.initList(context);
   // await CommonLabel.setLabel(isLocalActive.value);
    setLabel(labelList);
  }


  void setLabel(labelList) {
    print('$KEY labile length >>>>>>>>>>>> ${labelList.length}');
    for (var element in labelList) {
      if(element.CODE == LabelConstant.loginLblEnterActivationCode){

        loginLblEnterActivationCode.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;

      }else if(element.CODE == LabelConstant.loginLblActivationCodeText){

          loginLblActivationCode.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;

      }else if(element.CODE == LabelConstant.loginLblVerify){

          loginLblVerify.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;

      }
    }

  }


  checkActivationCode(context,String nationalityID, String mobileNo, activeCode ) async{
    ApplicationLoader.apiRequestLoader(context);
    CommonResponse check = await ApplicationApi(context).checkActivationCode(nationalityID, mobileNo,activeCode );

      if(check.success){
        ApplicationMemory.putString(ApplicationMemory.KEY_NID, nationalityID);
        ApplicationMemory.putString(ApplicationMemory.KEY_MOBILE_NO, mobileNo);
        Get.offAll(()=> const HomeScreen());

      }else {
        // AppDialog(context).showMessageDialog(login.message);
        AppDialog(context).showMessageDialog(isLocalActive.value ? check.message_native : check.message );
      }

  }
}
