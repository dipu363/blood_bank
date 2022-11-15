import 'package:flutter/foundation.dart';

import '../data/application_api.dart';
import '../data/requestModel/CodeModel.dart';
import '../data/responseModel/CodeResponse.dart';
import 'LabelConstant.dart';

class InitialLabel {
  static List<CodeModel> labelList = [];

  static String commonEmptyField = "";
  static String commonCheckConnection = "";
  static String commonLoaderText = "";
  static String commonPressBack = "";
  static String commonConnectServer = "";
  static String commonOk = "";
  static String commonEn = "";
  static String commonAr = "";
  static String commonSubmit = "";
  static String commonLogout = "";
  static String commonLogoutTitle = "";

//  static String homeFormCode = "A00002";
  static String homeNationalId = "";
  static String homeOptions = "";
  static String homeRegistration = "";
  static String homeCreateAppointment = "";
  static String homeHistoryQuestionnaire = "";
  static String homeCancelAppointment = "";

  static Future<void> initLabelList(fromCode, context) async {
    if (labelList.isEmpty) {
      CodeResponse? res = await ApplicationApi(context).getLabelText(fromCode);
      if (res != null) {
        labelList = res.data;
      }
    }
    if (kDebugMode) {
      print(">>>>>>>>>> init done");
    }
  }

  static Future<void> setLabel(isNative) async {
    for (var element in labelList) {
      if (element.CODE == LabelConstant.homeNationalId) {
        homeNationalId = isNative ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.homeOptions) {
        homeOptions = isNative ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.homeRegistration) {
        homeRegistration = isNative ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.homeCreateAppointment) {
        homeCreateAppointment = isNative ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.homeHistoryQuestionnaire) {
        homeHistoryQuestionnaire = isNative ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if (element.CODE == LabelConstant.homeCancelAppointment) {
        homeCancelAppointment = isNative ? element.NAME_NATIVE : element.NAME_GLOBAL;
      }
    }
  }
}
