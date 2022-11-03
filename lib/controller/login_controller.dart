
import 'package:blood_bank/utils/dialog/AppToast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../data/application_api.dart';
import '../data/requestModel/CodeModel.dart';
import '../data/responseModel/CodeResponse.dart';
import '../data/responseModel/CommonResponse.dart';
import '../screen/token_screen.dart';
import '../utils/AppUtils.dart';
import '../utils/ApplicationMemory.dart';
import '../utils/CommonLabel.dart';
import '../utils/LabelConstant.dart';
import '../utils/TextStore.dart';
import '../utils/dialog/AppDialog.dart';
import '../utils/dialog/ApplicationLoader.dart';

class LoginController extends GetxController{
final String KEY = 'LoginController';
  final loginKey = GlobalKey<FormState>();
  TextEditingController nidController =  TextEditingController();
  TextEditingController mobileNoController = TextEditingController();

  var isLocalActive = true.obs;
  List<CodeModel> labelList =[];
  var isLoadingLabel = true.obs;

  var lblNatId = "".obs;
  var lblMobileNo = "".obs;
  var loginLblLogin = "".obs;
  var loginLblEnterMobileAndNID = "".obs;
  var loginLbl10DigitRequired = "".obs;




  void initData(var context) async {
    var lang = await ApplicationMemory.getString(ApplicationMemory.KEY_LANGUAGE);
    print('$KEY >>>>>>>> language == $lang');
     isLocalActive.value = lang !=  TextStore.common_lang_english ? true : false;
    await CommonLabel.initList(context);
    await CommonLabel.setLabel(isLocalActive.value);
    print('$KEY >>>>>>>> local active == $isLocalActive');
    if (await AppUtils.checkConnection()) {
      _getLabel(context);
    }
  }

  void _getLabel(BuildContext context) async{
    CodeResponse? res = await ApplicationApi(context).getLabelText(LabelConstant.loginFormCode);

      if(res != null){
        isLoadingLabel.value = false ;
        labelList = res.data;
        print('$KEY >>>>  labelList length = ${labelList.length}');
        setLabel();
      }

  }

  void setLabel() {
    for (var element in labelList) {
      if(element.CODE == LabelConstant.loginLblNatID){
          lblNatId.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;

      }else if(element.CODE == LabelConstant.loginLblMobileNo){

          lblMobileNo.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;

      }else if(element.CODE == LabelConstant.loginLblLogin){

          loginLblLogin.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;

      }else if(element.CODE == LabelConstant.loginLblEnterMobileAndNID){

          loginLblEnterMobileAndNID.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;

      }else if(element.CODE == LabelConstant.loginLbl10DigitRequired){

          loginLbl10DigitRequired.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }
    }

  }


 void login(var context,String nationalityID, String mobileNo, labelList, ) async{
  ApplicationLoader.apiRequestLoader(context);
  CommonResponse login = await ApplicationApi(context).login(nationalityID, mobileNo);
  if(login.success){
    Get.offAll(TokenScreen(nationalityID, mobileNo, login.data, labelList));
  }else {
    AppDialog(context).showMessageDialog(isLocalActive.value ? login.message_native : login.message, );
  }
}


}