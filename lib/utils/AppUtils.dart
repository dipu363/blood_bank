
import 'dart:io';
import 'package:intl/intl.dart';




class AppUtils  {

  static checkConnection() async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static String getFormattedTime(String jsonTime){
    String fullTime = jsonTime.length == 3 ? "0"+jsonTime : jsonTime;
    String fastTwoDigit = fullTime.substring(0, 2);
    String lastTwoDigit = fullTime.substring(fullTime.length - 2);
    return fastTwoDigit+":"+lastTwoDigit;
  }

  static String convertApiDateToStringDate(apiDate){
    DateTime appDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(apiDate);
    return DateFormat("yyyy-MM-dd").format(appDate);
  }

  static DateTime convertApiDateToDateTime(apiDate){
    DateTime appDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(apiDate);
    return appDate;
  }

}
