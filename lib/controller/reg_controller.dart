import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/application_api.dart';
import '../data/requestModel/CodeModel.dart';
import '../data/requestModel/registration_model.dart';
import '../data/responseModel/CodeResponse.dart';
import '../data/responseModel/registration_response.dart';
import '../data/responseModel/transletion_response.dart';
import '../utils/ApplicationMemory.dart';

class RegistrationController extends GetxController {
  final String key = 'RegistrationController';
  final String regFormCode = "T12127";
  final String LANG_GLOBAL = "1";
  final String LANG_NATIVE = "2";

  late RegistrationModel demographicData;

  var nidController = TextEditingController();
  var phoneController = TextEditingController();

  var firstNameEnController = TextEditingController();
  var firstNameArController = TextEditingController();

  var fatherNameEnController = TextEditingController();
  var fatherNameArController = TextEditingController();

  var familyNameEnController = TextEditingController();
  var familyNameArController = TextEditingController();

  var ageController = TextEditingController();
  var homePhoneController = TextEditingController();

  /*label*/

  var loaderDemographicData = true.obs;
  var isLoadingLabel = true.obs;
  var  islocalactive = true.obs;

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
  var loaderNationality = true.obs;
  var loaderGender = true.obs;
  var loaderDays = true;
  var loaderYear = true;

  List<CodeModel> nationalList = [];
   var selectedNationalCode = CodeModel().obs;
   //var selecteditem = ''.obs;
  List<CodeModel> genderList = [];
  var selectedGenderCode = CodeModel().obs;
  List<CodeModel> daysList = [];
  late CodeModel selectedDayGregoi;
  late CodeModel selectedDayHijri;

  List<CodeModel> monthListGregorian = [];
  late CodeModel selectedMonthGregoi;

  List<CodeModel> monthListHijri = [];
  late CodeModel selectedMonthHijri;

  List<CodeModel> yearsListGregoi = [];
  late CodeModel selectedYearGregoi;

  List<CodeModel> yearsListHijri = [];
  late CodeModel selectedYearHijri;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }

  void initData() async {
    nationalId.value =
        await ApplicationMemory.getString(ApplicationMemory.KEY_NID);
    phoneNo.value =
        await ApplicationMemory.getString(ApplicationMemory.KEY_MOBILE_NO);
    patNo.value =
        await ApplicationMemory.getString(ApplicationMemory.KEY_PAT_NO) ?? "";
    nidController.text = nationalId.value;
    phoneController.text = phoneNo.value;
    getDemographicData(Get.context);
  }

  void getTranslatedName(
      context, name, lang, TextEditingController controller, int serial) async {
    if (serial == 1) {
      loaderFirstNameAr.value = true;
    } else if (serial == 2) {
      loaderFatherNameAr.value = true;
    } else if (serial == 3) {
      loaderFamilyNameAr.value = true;
    } else if (serial == 4) {
      loaderFirstNameEn.value = true;
    } else if (serial == 5) {
      loaderFatherNameEn.value = true;
    } else if (serial == 6) {
      loaderFamilyNameEn.value = true;
    }

    TranslatedNameResponse res =
        await ApplicationApi(context).getTransletedname(name, lang);

    if (serial == 1) {
      loaderFirstNameAr.value = false;
    } else if (serial == 2) {
      loaderFatherNameAr.value = false;
    } else if (serial == 3) {
      loaderFamilyNameAr.value = false;
    } else if (serial == 4) {
      loaderFirstNameEn.value = false;
    } else if (serial == 5) {
      loaderFatherNameEn.value = false;
    } else if (serial == 6) {
      loaderFamilyNameEn.value = false;
    }

    if (res != null) {
      lang == LANG_NATIVE
          ? controller.text = res.data!.NAME_NATIVE
          : controller.text = res.data!.NAME_GLOBAL;
    }
  }

  void getDemographicData(context) async {
    RegistrationResponse res = await ApplicationApi(context)
        .getDemographicData(nationalId.value, phoneNo.value);
   // print('$key :: demographic dara : ${res.data}');
    loaderDemographicData.value = false;
    if (!res.data.isNull) {
      demographicData = res.data;
      firstNameArController.text = demographicData.tFIRSTLANG1NAME ?? '';
      firstNameEnController.text = demographicData.tFIRSTLANG2NAME ?? '';
      fatherNameArController.text = demographicData.tFATHERLANG1NAME ?? '';
      fatherNameEnController.text = demographicData.tFATHERLANG2NAME ?? '';
      familyNameArController.text = demographicData.tFAMILYLANG1NAME ?? '';
      familyNameEnController.text = demographicData.tFAMILYLANG2NAME ?? '';
      homePhoneController.text = demographicData.tPHONEHOME ?? '';
    }

    _getNationality(context);
    _getGender(context);
    /* _getDays();
    _getYears();*/
  }

  void _getNationality(context) async {
    CodeResponse res = await ApplicationApi(context).getNationality();
    loaderNationality.value = false;
    if (res.data.isNotEmpty) {
      nationalList = res.data;
     // print('$key nationallist lanth ${nationalList.length}');
    }

    for (var element in nationalList) {
      print('$key :: element ${element.CODE}');
      if (element.CODE == demographicData.tNTNLTYCODE) {
        selectedNationalCode.value = element ;
       // print('$key ::  selected code ${selectedNationalCode.value.NAME_GLOBAL} ');
      }
    }
  }

  void _getGender(context) async {
    CodeResponse res = await ApplicationApi(context).getGender();
    loaderGender.value = false;
    if (res.data.isNotEmpty) {
      genderList = res.data;
    }

    for (var element in genderList) {
      if (element.CODE == demographicData.tGENDER) {
        selectedGenderCode.value = element ;
       // print('$key :: ${selectedGenderCode.value.NAME_GLOBAL}');
      }
    }
  }

/*  void _getDays() async{
    CodeResponse res = await ApplicationApi(context).getDays();
    setState(() {
      loaderDays = false;
      if(res != null && res.data.length > 0){
        daysList = res.data;
        if(demographicData.T_BIRTH_DATE != null && demographicData.T_BIRTH_DATE != ""){
          DateTime birthday = AppUtils.convertApiDateToDateTime(demographicData.T_BIRTH_DATE);
          var hijriDate = new HijriCalendar.fromDate(birthday);

          _setSelectedYearHijri(hijriDate.hYear.toString());

          _setSelectedMonthGregorian(birthday.month.toString());
          _setSelectedMonthHijri(hijriDate.hMonth.toString());

          _setSelectedDay(birthday.day.toString(), false);
          _setSelectedDay(hijriDate.hDay.toString(), true);

          _doAgeCalculation();

        }
      }
    });
  }

  void _getYears() async{
    CodeResponse res = await ApplicationApi(context).getYears();
    setState(() {
      loaderYear = false;
      if(res != null && res.data.length > 0){
        yearsListGregoi = res.data;
        if(demographicData.T_BIRTH_DATE != null && demographicData.T_BIRTH_DATE != ""){
          DateTime birthday = AppUtils.convertApiDateToDateTime(demographicData.T_BIRTH_DATE);
          // var hijriDate = new HijriCalendar.fromDate(birthday);
          _setSelectedYearGregorian(birthday.year.toString());
          _doAgeCalculation();
        }
      }
    });
  }*/
}
