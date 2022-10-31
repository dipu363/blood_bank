
//const baseUrl = "https://rms.rufaida.com.my/BloodBankAPI/api/"; //live
// const baseUrl = "http://100.43.0.22/BloodBankAPI/api/"; //local
 import 'package:blood_bank/data/responseModel/CodeResponse.dart';
import 'package:blood_bank/data/responseModel/CommonResponse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/CommonLabel.dart';
import '../utils/dialog/AppToast.dart';

const baseUrl = "http://202.40.189.19/BloodBankAPI/api/"; //local



class ApplicationApi{
  Dio dio = Dio();
  BuildContext context;
  ApplicationApi(this.context);



  /*========================== Label ==========================*/
  Future<CodeResponse?> getLabelText(formCode) async {

    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> call getLabelText $formCode");
    CodeResponse? res;
    try {
      var url = "${baseUrl}GetLabelText";
      var queryParameters = {"formcode": formCode};
      final response = await dio.get(url, queryParameters : queryParameters);
      res = CodeResponse.fromJson(response.data);
    } catch (e) { _onError(e, false);}
    return res;

  }

  /*========================== UTILS ==========================*/
  void _onError(e, isLoaded){
    if(isLoaded){
      Navigator.pop(context);
      AppToast(context).showToast(CommonLabel.commonConnectServer, AppToast.ERROR, AppToast.LONG);
    }
    if (kDebugMode) {
      print(e);
    }
  }


  /*========================== LOGIN ==========================*/
  Future<CommonResponse> login(String nationalityID, String mobileNo) async {
    CommonResponse ?res;
    try {
      var url = baseUrl + "CheckDonorLogin";
      var queryParameters = {"nationalityID": nationalityID, "mobileNo": mobileNo};
      final response = await dio.post(url,queryParameters: queryParameters);
      res = CommonResponse.fromJson(response.data);
      Get.clearRouteTree();
    } catch (e) { _onError(e, true);}
    return res!;
  }

  Future<CommonResponse> checkActivationCode(String nationalityID, String mobileNo, String activeCode) async {
    CommonResponse? res;
    try {
      var url = baseUrl + "CheckActivationCode";
      var queryParameters = {"nationalityID": nationalityID, "mobileNo": mobileNo, "actvCode": activeCode};
      final response = await dio.post(url,queryParameters: queryParameters);
      res = CommonResponse.fromJson(response.data);
      //Navigator.pop(context);
      Get.clearRouteTree();
    } catch (e) { _onError(e, true);}
    return res!;
  }

  Future<CommonResponse> checkCurrentStage(String nationalityID, String mobileNo) async {
    CommonResponse? res;
    try {
      var url = baseUrl + "CheckCurrentStage";
      var queryParameters = {"nationalityID": nationalityID, "mobileNo": mobileNo};
      final response = await dio.get(url,queryParameters: queryParameters);
      res = CommonResponse.fromJson(response.data);
     // Navigator.pop(context);
      Get.clearRouteTree();
    } catch (e) { _onError(e, true);}
    return res!;
  }





}