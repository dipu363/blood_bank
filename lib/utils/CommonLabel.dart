
import 'package:blood_bank/utils/LabelConstant.dart';
import 'package:flutter/foundation.dart';

import '../data/application_api.dart';
import '../data/requestModel/CodeModel.dart';
import '../data/responseModel/CodeResponse.dart';

class CommonLabel{

  static String key = 'CommonLabel';
  static List<CodeModel> commonLabelList = [];

   static String commonEmptyField  = "";
   static String  commonCheckConnection = "";
   static String  commonLoaderText = "";
   static String  commonPressBack = "";
   static String  commonConnectServer = "";
   static String  commonOk = "";
   static String  commonEn = "";
   static String  commonAr = "";
   static String  commonSubmit = "";
   static String  commonLogout = "";
   static String  commonLogoutTitle = "";


  static Future<void> initList(context) async{
    if( commonLabelList.isEmpty){
      CodeResponse? res = await ApplicationApi(context).getLabelText(LabelConstant.commonFormCode);
      if(res != null){
        commonLabelList = res.data;
      }
    }
    if (kDebugMode) {
      print("$key >>>>>>>>>> commonLabelList init done");
    }
  }

  static Future<void>?setLabel(isNative){
    for (var element in commonLabelList) {
      if(element.CODE == LabelConstant.commonEmptyField){
        commonEmptyField = isNative ?  element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.commonCheckConnection){
        commonCheckConnection = isNative ?  element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.commonLoaderText){
        commonLoaderText = isNative ?  element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.commonPressBack){
        commonPressBack = isNative ?  element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.commonConnectServer){
        commonConnectServer = isNative ?  element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.commonOk){
        commonOk = isNative ?  element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.commonEn){
        commonEn = isNative ?  element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.commonAr){
        commonAr = isNative ?  element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.commonSubmit){
        commonSubmit = isNative ?  element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.commonLogout){
        commonLogout = isNative ?  element.NAME_NATIVE : element.NAME_GLOBAL;
      }else if(element.CODE == LabelConstant.commonLogoutTitle){
        commonLogoutTitle = isNative ?  element.NAME_NATIVE : element.NAME_GLOBAL;
      }
    }
    return null;

  }

}