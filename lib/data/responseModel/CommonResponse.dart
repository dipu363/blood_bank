
class CommonResponse {
  bool success;
  String message;
  String message_native;
  String data;


  CommonResponse(this.success, this.message, this.message_native, this.data);

  CommonResponse.fromJson(Map json)
      : success = json['success'],
        message = json['message'] ?? "",
        message_native = json['message_native'] ?? "",
        data = json['data'] ?? ""
    ;


}