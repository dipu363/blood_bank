

import '../requestModel/CodeModel.dart';

class TranslatedNameResponse {
  bool ?success;
  String? message;
  int ?total;
  CodeModel ?data;


 // TranslatedNameResponse(this.success, this.message, this.total, this.data);

  TranslatedNameResponse.fromJson(Map json){
    success = json['success'];
    message = json['message'] ?? "";
    total = json['total'];
    data = total!>0 ? CodeModel.fromJson(json['data']) : CodeModel("","","");
  }
}