import '../requestModel/registration_model.dart';

class RegistrationResponse {
  late bool success;
  late String message;
  late int total;
  late RegistrationModel data;

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    data = (json['data'] != null ? RegistrationModel.fromJson(json['data']) : null)!;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['data'] = this.data.toJson();
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
