import 'package:blood_bank/controller/label_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/application_api.dart';
import '../data/requestModel/CodeModel.dart';
import '../data/requestModel/registration_model.dart';
import '../data/responseModel/registration_response.dart';
import '../data/responseModel/transletion_response.dart';
import '../utils/AppUtils.dart';
import '../utils/ApplicationMemory.dart';
import '../utils/CommonLabel.dart';
import '../utils/TextStore.dart';

class RegistrationController extends GetxController {
  final String key = 'RegistrationController';
  final String regFormCode = "T12127";
  final String  LANG_GLOBAL = "1";
  final String  LANG_NATIVE = "2";

  var nidController =  TextEditingController();
  var phoneController =  TextEditingController();

  var firstNameEnController =  TextEditingController();
  var firstNameArController =  TextEditingController();

  var fatherNameEnController =  TextEditingController();
  var fatherNameArController =  TextEditingController();

  var familyNameEnController =  TextEditingController();
  var familyNameArController =  TextEditingController();

  var ageController =  TextEditingController();
  var homePhoneController =  TextEditingController();


  /*label*/

  var loaderDemographicData = true.obs;
  var isLoadingLabel = true.obs;


  var nationalId = "".obs;
  var phoneNo = "".obs;
  var patNo = "".obs;
/*textField*/
  var loaderFirstNameEn = false.obs;
  var loaderFirstNameAr = false.obs;

  var loaderFatherNameEn = false.obs;
  var loaderFatherNameAr = false.obs;

  var loaderFamilyNameEn = false.obs;
  var loaderFamilyNameAr = false.obs;

@override
  void onInit() {
    // TODO: implement onInit

    initData();

    super.onInit();
  }


  void initData() async {
    nationalId.value = await ApplicationMemory.getString(ApplicationMemory.KEY_NID);
    phoneNo.value = await ApplicationMemory.getString(ApplicationMemory.KEY_MOBILE_NO);
    patNo.value = await ApplicationMemory.getString(ApplicationMemory.KEY_PAT_NO) ?? "";
    nidController.text = nationalId.value ;
    phoneController.text = nationalId.value ;

    var total = " id ${nationalId.value} phone ${phoneNo.value} patient ${patNo.value}";
    print( '$key :: $total');
    getDemographicData(Get.context);
  }


  void getTranslatedName(context,name, lang, TextEditingController controller, int serial) async{

      if(serial == 1){loaderFirstNameAr.value = true;}
      else if(serial == 2){loaderFatherNameAr.value = true;}
      else if(serial == 3){loaderFamilyNameAr.value = true;}
      else if(serial == 4){loaderFirstNameEn.value = true;}
      else if(serial == 5){loaderFatherNameEn.value = true;}
      else if(serial == 6){loaderFamilyNameEn.value = true;}

    TranslatedNameResponse res = await ApplicationApi(context).getTransletedname(name, lang);


      if(serial == 1){ loaderFirstNameAr.value = false; }
      else if(serial == 2){ loaderFatherNameAr.value = false; }
      else if(serial == 3){ loaderFamilyNameAr.value = false; }
      else if(serial == 4){ loaderFirstNameEn.value = false;}
      else if(serial == 5){ loaderFatherNameEn.value = false;}
      else if(serial == 6){ loaderFamilyNameEn.value = false;}

      if(res != null){
        lang == LANG_NATIVE ? controller.text = res.data!.NAME_NATIVE : controller.text = res.data!.NAME_GLOBAL;
      }

  }



  void getDemographicData(context) async{
    var res = await ApplicationApi(context).getDemographicData(nationalId.value , phoneNo.value);
    print('$key :: demographic dara : ${res.data}');
      loaderDemographicData.value = false;
      if(res != null){
        RegistrationModel demographicData  = res.data;
        firstNameArController.text = demographicData.tFIRSTLANG1NAME ?? '';
        firstNameEnController.text = demographicData.tFIRSTLANG2NAME ?? '';
        fatherNameArController.text = demographicData.tFATHERLANG1NAME ?? '';
        fatherNameEnController.text = demographicData.tFATHERLANG2NAME ?? '';
        familyNameArController.text = demographicData.tFAMILYLANG1NAME ?? '';
        familyNameEnController.text = demographicData.tFAMILYLANG2NAME ?? '';
        homePhoneController.text = demographicData.tPHONEHOME ?? '';

      }


/*  _getNationality();
    _getGender();
    _getDays();
    _getYears();*/
  }
}
