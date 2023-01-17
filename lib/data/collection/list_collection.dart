import '../requestModel/CodeModel.dart';

class ListCollection {
  List<CodeModel> getMonthListGregorian() {
    List<CodeModel> monthList = <CodeModel>[];
    /*monthList.addAll({
      CodeModel("01", "يناير", "January"),
      CodeModel("02", "شهر فبراير", "February"),
      CodeModel("03", "مارس", "March"),
      CodeModel("04", "أبريل", "April"),
      CodeModel("05", "مايو", "May"),
      CodeModel("06", "يونيو", "June"),
      CodeModel("07", "تموز", "July"),
      CodeModel("08", "أغسطس", "August"),
      CodeModel("09", "سبتمبر", "September"),
      CodeModel("10", "اكتوبر", "October"),
      CodeModel("11", "شهر نوفمبر", "November"),
      CodeModel("12", "ديسمبر", "December"),
    });*/

    return monthList;
  }

  List<CodeModel> getMonthListHijri() {
    List<CodeModel> monthList = <CodeModel>[];
    /*monthList.addAll({
      CodeModel("01", "شهر محرم", "Muharram"),
      CodeModel("02", "سفر", "Safar"),
      CodeModel("03", "ربيع الأول", "Rabi' al-awwal"),
      CodeModel("04", "ربيع الثاني", "Rabi' al-thani"),
      CodeModel("05", "جمادى الاول", "Jumada al-awwal"),
      CodeModel("06", "جمادى الثانية", "Jumada al-thani"),
      CodeModel("07", "رجب", "Rajab"),
      CodeModel("08", "شعبان", "Sha'aban"),
      CodeModel("09", "رمضان", "Ramadan"),
      CodeModel("10", "شوال", "Shawwal"),
      CodeModel("11", "ذو القعدة", "Dhu al-Qi'dah"),
      CodeModel("12", "ذو الحجة", "Dhu al-Hijjah")
    });*/

    return monthList;
  }

  List<CodeModel> getYearListHijri() {
    List<CodeModel> yearList = <CodeModel>[];
    /*yearList.addAll({
      CodeModel("01", "١٣٥٦", "1356"),
      CodeModel("02", "١٣٥٧", "1357"),
      CodeModel("03", "١٣٥٨", "1358"),
      CodeModel("04", "١٣٥٩", "1359"),
      CodeModel("01", "١٣٦٠", "1360"),
      CodeModel("02", "١٣٦١", "1361"),
      CodeModel("03", "١٣٦٢", "1362"),
      CodeModel("04", "١٣٦٣", "1363"),
      CodeModel("05", "١٣٦٤", "1364"),
      CodeModel("06", "١٣٦٥", "1365"),
      CodeModel("07", "١٣٦٦", "1366"),
      CodeModel("08", "١٣٦٧", "1367"),
      CodeModel("09", "١٣٦٨", "1368"),
      CodeModel("10", "١٣٦٩", "1369"),
      CodeModel("01", "١٣٧٠", "1370"),
      CodeModel("02", "١٣٧١", "1371"),
      CodeModel("03", "١٣٧٢", "1372"),
      CodeModel("04", "١٣٧٣", "1373"),
      CodeModel("05", "١٣٧٤", "1374"),
      CodeModel("06", "١٣٧٥", "1375"),
      CodeModel("07", "١٣٧٦", "1376"),
      CodeModel("08", "١٣٧٧", "1377"),
      CodeModel("09", "١٣٧٨", "1378"),
      CodeModel("10", "١٣٧٩", "1379"),
      CodeModel("01", "١٣٨٠", "1380"),
      CodeModel("02", "١٣٨١", "1381"),
      CodeModel("03", "١٣٨٢", "1382"),
      CodeModel("04", "١٣٨٣", "1383"),
      CodeModel("05", "١٣٨٤", "1384"),
      CodeModel("06", "١٣٨٥", "1385"),
      CodeModel("07", "١٣٨٦", "1386"),
      CodeModel("08", "١٣٨٧", "1387"),
      CodeModel("09", "١٣٨٨", "1388"),
      CodeModel("10", "١٣٨٩", "1389"),
      CodeModel("01", "١٣٩٠", "1390"),
      CodeModel("02", "١٣٩١", "1391"),
      CodeModel("03", "١٣٩٢", "1392"),
      CodeModel("04", "١٣٩٣", "1393"),
      CodeModel("05", "١٣٩٤", "1394"),
      CodeModel("06", "١٣٩٥", "1395"),
      CodeModel("07", "١٣٩٦", "1396"),
      CodeModel("08", "١٣٩٧", "1397"),
      CodeModel("09", "١٣٩٨", "1398"),
      CodeModel("10", "١٣٩٩", "1399"),
      CodeModel("01", "١٤٠٠", "1400"),
      CodeModel("02", "١٤٠١", "1401"),
      CodeModel("03", "١٤٠٢", "1402"),
      CodeModel("04", "١٤٠٣", "1403"),
      CodeModel("05", "١٤٠٤", "1404"),
      CodeModel("06", "١٤٠٥", "1405"),
      CodeModel("07", "١٤٠٦", "1406"),
      CodeModel("08", "١٤٠٧", "1407"),
      CodeModel("09", "١٤٠٨", "1408"),
      CodeModel("10", "١٤٠٩", "1409"),
      CodeModel("01", "١٤٠٠", "1400"),
      CodeModel("02", "١٤٠١", "1401"),
      CodeModel("03", "١٤٠٢", "1402"),
      CodeModel("04", "١٤٠٣", "1403"),
      CodeModel("05", "١٤٠٤", "1404"),
      CodeModel("06", "١٤٠٥", "1405"),
      CodeModel("07", "١٤٠٦", "1406"),
      CodeModel("08", "١٤٠٧", "1407"),
      CodeModel("09", "١٤٠٨", "1408"),
      CodeModel("10", "١٤٠٩", "1409"),
      CodeModel("01", "١٤١٠", "1410"),
      CodeModel("02", "١٤١١", "1411"),
      CodeModel("03", "١٤١٢", "1412"),
      CodeModel("04", "١٤١٣", "1413"),
      CodeModel("05", "١٤١٤", "1414"),
      CodeModel("06", "١٤١٥", "1415"),
      CodeModel("07", "١٤١٦", "1416"),
      CodeModel("08", "١٤١٧", "1417"),
      CodeModel("09", "١٤١٨", "1418"),
      CodeModel("10", "١٤١٩", "1419"),
      CodeModel("01", "١٤٢٠", "1420"),
      CodeModel("02", "١٤٢١", "1421"),
      CodeModel("03", "١٤٢٢", "1422"),
      CodeModel("04", "١٤٢٣", "1423"),
      CodeModel("05", "١٤٢٤", "1424"),
      CodeModel("06", "١٤٢٥", "1425"),
      CodeModel("07", "١٤٢٦", "1426"),
      CodeModel("08", "١٤٢٧", "1427"),
      CodeModel("09", "١٤٢٨", "1428"),
      CodeModel("10", "١٤٢٩", "1429")
    });*/

    return yearList;
  }




}
