

import 'package:blood_bank/utils/ApplicationMemory.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../data/application_api.dart';
import '../data/requestModel/CodeModel.dart';
import '../data/responseModel/CodeResponse.dart';
import '../data/responseModel/CommonResponse.dart';
import '../screen/login_screen.dart';
import '../utils/AppUtils.dart';
import '../utils/CommonLabel.dart';
import '../utils/LabelConstant.dart';
import '../utils/TextStore.dart';
import '../utils/dialog/ApplicationLoader.dart';

class HomeController extends GetxController{
  static String key = 'HomeController.';


  /*property*/

  var nationalId = "".obs;
  var phoneNo = "".obs;
  var patNo = "".obs;
  var fullName = "".obs;


  var homeNationalId = "".obs;
  var homeOptions = "".obs;
  var homeRegistration = "".obs;
  var homeCreateAppointment = "".obs;
  var homeHistoryQuestionnaire = "".obs;
  var homeCancelAppointment = "".obs;

  /*label*/
  var isLocalActive = true.obs;
  List<CodeModel> labelList =[];
  var isLoadingLabel = true.obs;

  /*stage*/
  var currentStage = 0.obs;
  @override
  void onInit() {
    super.onInit();
    initData(Get.context);

  }

  void initData(context) async {

    var nid = await ApplicationMemory.getString(ApplicationMemory.KEY_NID);
    var phone = await ApplicationMemory.getString(ApplicationMemory.KEY_MOBILE_NO);
    var pNo = await ApplicationMemory.getString(ApplicationMemory.KEY_PAT_NO);
    var fName = await ApplicationMemory.getString(ApplicationMemory.KEY_FULL_NAME_EN);
    var lang = await ApplicationMemory.getString(ApplicationMemory.KEY_LANGUAGE);
    var cStage = await ApplicationMemory.getString(ApplicationMemory.KEY_CURRENT_STAGE);


      nationalId.value = nid;
      phoneNo.value = phone;
      patNo.value = pNo ?? "";
      fullName.value = fName ?? "";
      isLocalActive.value = lang !=  TextStore.common_lang_english ? true : false;
      currentStage.value= int.parse(cStage ?? "1");



    if (await AppUtils.checkConnection()) {
      await CommonLabel.initList(context);
      await CommonLabel.setLabel(isLocalActive.value);
      _getLabel(context);
      _checkCurrentStage(context);
    }
  }

  void setLabel() {
    for (var element in labelList) {
      if(element.CODE == LabelConstant.homeNationalId){
          homeNationalId.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.homeOptions){
          homeOptions.value= isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.homeRegistration){
          homeRegistration.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.homeCreateAppointment){
          homeCreateAppointment.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.homeHistoryQuestionnaire){
          homeHistoryQuestionnaire.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.homeCancelAppointment){
          homeCancelAppointment.value = isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }
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
  void _getLabel(context) async{
    CodeResponse? res = await ApplicationApi(context).getLabelText(LabelConstant.homeFormCode);
      isLoadingLabel.value = false;
      if(res != null){
        labelList = res.data;

        setLabel();
      }

  }

  void _checkCurrentStage(context) async{
    ApplicationLoader.apiRequestLoader(context);
    CommonResponse res = await ApplicationApi(context).checkCurrentStage(nationalId.value, phoneNo.value);
    if(res.success){
      if (kDebugMode) {
        print('$key current step ${res.data}');
      }
      ApplicationMemory.putString(ApplicationMemory.KEY_CURRENT_STAGE, res.data);
      currentStage.value = int.parse(res.data);
    }
  }
}