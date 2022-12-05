import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../data/application_api.dart';
import '../data/requestModel/CodeModel.dart';
import '../data/responseModel/CodeResponse.dart';
import '../utils/ApplicationMemory.dart';
import '../utils/CommonLabel.dart';
import '../utils/LabelConstant.dart';
import '../utils/TextStore.dart';
import '../utils/dialog/AppToast.dart';

class LabelController extends GetxController {
  final String  key = 'LabelController';

  var isLocalActive = true.obs;
  List<CodeModel> labelList = [];


  /*Login Screen Label*/
  var lblNatId = "".obs;
  var lblMobileNo = "".obs;
  var loginLblLogin = "".obs;
  var loginLblEnterMobileAndNID = "".obs;
  var loginLbl10DigitRequired = "".obs;

  /*Home Screen Label*/
  var homeNationalId = "".obs;
  var homeOptions = "".obs;
  var homeRegistration = "".obs;
  var homeCreateAppointment = "".obs;
  var homeHistoryQuestionnaire = "".obs;
  var homeCancelAppointment = "".obs;

  /*registration_screen Label*/
  var regiNid = "".obs;
  var regiPhone = "".obs;
  var regiFirstName = "".obs;
  var regiFatherName = "".obs;
  var regiFamilyName = "".obs;
  var regiNationality = "".obs;
  var regiGender = "".obs;
  var regiDobGregorian = "".obs;
  var regiDobHijri = "".obs;
  var regiHomePhone = "".obs;
  var regiAge = "".obs;
  var regiMobileShouldStartWith11 = "".obs;
  var regi10DigitReq = "".obs;


//Question screen label
 // static String questionFormCode = "T12131";
  var questionNid = "".obs;
  var questionDonorName = "".obs;
  var questionAttention = "".obs;
  var questionAtt = "".obs;
  var questionPleaseAnsAllQ = "".obs;
  var questionYes = "".obs;
  var questionNo = "".obs;
  var questionDonorConsent = "".obs;
  var questionConsent = "".obs;
  var questionDonConCheckbox = "".obs;

  /*crate_app_screen*/
 // static String createAppFormCode = "T12128";
  var createAppNid = "".obs;
  var createAppDonorName = "".obs;
  var createAppZone = "".obs;
  var createAppSite = "".obs;
  var createAppWarn = "".obs;
  var createNoDateAvail = "".obs;

  /*cancel_app_screen*/
 // var cancelAppFormCode = "T12129";
  var cancelAppNationalId = "".obs;
  var cancelAppTime = "".obs;
  var cancelAppApptNo = "".obs;
  var cancelAppDonorName = "".obs;
  var cancelAppAge = "".obs;
  var cancelAppGender = "".obs;
  var cancelAppNationality = "".obs;
  var cancelAppDate = "".obs;
  var cancelAppCancelReason = "".obs;
  var cancelAppRemark = "".obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() async {
    var lang =
    await ApplicationMemory.getString(ApplicationMemory.KEY_LANGUAGE);
    isLocalActive.value = lang != TextStore.common_lang_english ? true : false;

    await CommonLabel.initList(Get.context);
    await CommonLabel.setLabel(isLocalActive.value);

  }

  Future<void> initLabelList(fromCode, context) async {
    if (labelList.isEmpty) {
      CodeResponse? res = await ApplicationApi(context).getLabelText(fromCode);
      if (res != null) {
        labelList = res.data;
        if (kDebugMode) {
          print("$key .initLabelList :: >>>>>>>>>> labelList init done");
        }
        setLabel();
      } else {
        AppToast(context)
            .showToast('data not found', AppToast.ERROR, AppToast.LONG);
      }
    } else{
      labelList.clear();
      CodeResponse? res = await ApplicationApi(context).getLabelText(fromCode);
      if (res != null) {
        labelList = res.data;
        if (kDebugMode) {
          print("$key .initLabelList :: >>>>>>>>>> labelList init done");
        }
        setLabel();
      } else {
        AppToast(context)
            .showToast('data not found', AppToast.ERROR, AppToast.LONG);
      }
    }
  }

  void setLabel() {
    for (var element in labelList) {
      if (element.CODE == LabelConstant.loginLblNatID) {
        lblNatId.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.loginLblMobileNo) {
        lblMobileNo.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.loginLblLogin) {
        loginLblLogin.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.loginLblEnterMobileAndNID) {
        loginLblEnterMobileAndNID.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.loginLbl10DigitRequired) {
        loginLbl10DigitRequired.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.homeNationalId) {
        homeNationalId.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.homeOptions) {
        homeOptions.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.homeRegistration) {
        homeRegistration.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.homeCreateAppointment) {
        homeCreateAppointment.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.homeHistoryQuestionnaire) {
        homeHistoryQuestionnaire.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.homeCancelAppointment) {
        homeCancelAppointment.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiNationality) {
        regiNationality.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiNid) {
        regiNid.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiPhone) {
        regiPhone.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiFirstName) {
        regiFirstName.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiFatherName) {
        regiFatherName.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiFamilyName) {
        regiFamilyName.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiGender) {
        regiGender.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiDobGregorian) {
        regiDobGregorian.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiDobHijri) {
        regiDobHijri.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiHomePhone) {
        regiHomePhone.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiAge) {
        regiAge.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regiMobileShouldStartWith11) {
        regiMobileShouldStartWith11.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      } else if (element.CODE == LabelConstant.regi10DigitReq) {
        regi10DigitReq.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.questionNid) {
        questionNid.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.questionDonorName) {
        questionDonorName.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.questionAttention) {
        questionAttention.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.questionAtt) {
        questionAtt.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.questionPleaseAnsAllQ) {
        questionPleaseAnsAllQ.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.questionYes) {
        questionYes.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.questionNo) {
        questionNo.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.questionDonorConsent) {
        questionDonorConsent.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.questionConsent) {
        questionConsent.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.questionDonConCheckbox) {
        questionDonConCheckbox.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.createAppNid) {
        createAppNid.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.createAppDonorName) {
        createAppDonorName.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.createAppZone) {
        createAppZone.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.createAppSite) {
        createAppSite.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.createAppWarn) {
        createAppWarn.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.createNoDateAvail) {
        createNoDateAvail.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.cancelAppNationalId) {
        cancelAppNationalId.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.cancelAppTime) {
        cancelAppTime.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.cancelAppApptNo) {
        cancelAppApptNo.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.cancelAppDonorName) {
        cancelAppDonorName.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.cancelAppAge) {
        cancelAppAge.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.cancelAppGender) {
        cancelAppGender.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.cancelAppNationality) {
        cancelAppNationality.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.cancelAppDate) {
        cancelAppDate.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.cancelAppCancelReason) {
        cancelAppCancelReason.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.cancelAppRemark) {
        cancelAppRemark.value =
            isLocalActive.value ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }
    }
  }
}
