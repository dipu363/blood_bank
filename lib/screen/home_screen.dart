
import 'package:blinking_text/blinking_text.dart';
import 'package:blood_bank/controller/home_controller.dart';
import 'package:blood_bank/controller/label_controller.dart';
import 'package:blood_bank/screen/questionnaire_screen.dart';
import 'package:blood_bank/screen/reg_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/reg_controller.dart';
import '../utils/AppConstant.dart';
import '../utils/CommonLabel.dart';
import '../utils/LabelConstant.dart';
import '../utils/TextStore.dart';
import '../utils/dialog/AppDialog.dart';
import '../utils/dialog/AppToast.dart';
import 'appoint/cancel_appoint_screen.dart';
import 'appoint/create_appoint_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late DateTime currentBackPressTime;


  LabelController labelController = Get.put(LabelController());
  HomeController hController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
labelController.initLabelList(LabelConstant.homeFormCode, context);
    return WillPopScope(
      onWillPop: onWillPop ,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  SafeArea(
             child: Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children:  [

                   _top(),
                   _getHeader(),
                  Expanded(
                     child: _getOptions2(),
                   )
                 ],
               ),
             )
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 3)) {
      currentBackPressTime = now;
      AppToast(context).showToast(
          CommonLabel.commonPressBack, AppToast.SUCCESS, AppToast.SHORT);
      return Future.value(false);
    }
    return Future.value(true);
  }

  Widget _top() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: AppConstant.appGradients,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      child: Row(
        children: [
          Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          AppDialog(context).showConfirmDialog(CommonLabel.commonLogout, CommonLabel.commonLogoutTitle, hController.logout);
                        },
                        child: const Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Obx(()=>
                             Text(
                              hController.fullName.value,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Obx(()=>
                            Text(
                              hController.phoneNo.value,
                              style: const TextStyle(color: Colors.white, fontSize: 12.0),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Row(
                    children:  [

                        Obx(()=>
                          Text(
                            labelController.homeNationalId.value,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),

                      const SizedBox(width: 5.0,),
                      Obx(()=>
                        Text(
                          hController.nationalId.value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              )

          ),


          Column(
            children: [
              Container(
                color: Colors.white,
                child: SizedBox(
                  child: Image.asset(
                    TextStore.img_ministry_logo,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ],
      ),

    );
  }

  Widget _getHeader(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

            Obx(()=>Text(
               labelController.homeOptions.value,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0
                ),
              ),
            ),

        ],
      ),
    );
  }
  Widget _getOptions2(){
    return GridView(

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,


      ),
      children: <Widget>[

        Obx(() => getItem(icon: Icons.add_box_outlined, text: labelController.homeRegistration.value.toString(), screen: const RegistrationScreen(), isBlink: hController.currentStage.value == 1, item : 1)),
        Obx(() => getItem(icon: Icons.history, text: labelController.homeHistoryQuestionnaire.value.toString(), screen: const QuestionnaireScreen(), isBlink: hController.currentStage.value == 2, item : 2)),
        Obx(() => getItem(icon: Icons.create, text: labelController.homeCreateAppointment.value.toString(), screen: const CreateAppointmentScreen(), isBlink: hController.currentStage.value == 3, item : 3)),
        Obx(() => getItem(icon: Icons.delete, text: labelController.homeCancelAppointment.value.toString(), screen: const CancelAppointmentScreen(), isBlink: hController.currentStage.value == 4, item : 4)),
      ],
    );
  }
  Widget getItem({icon, text, screen, required bool isBlink, required int item}){
    return InkWell(
      onTap: (){
        if(item == 2 && hController.currentStage.value < 2){
          AppDialog(context).showMessageDialog("First Complete Registration");
        }else if(item == 3 && hController.currentStage.value < 3){
          AppDialog(context).showMessageDialog("Complete History Questionnaire");
        }else if(item == 4 && hController.currentStage.value < 4){
          AppDialog(context).showMessageDialog("First Create An Appointment");
        }else{
          Get.to(screen);
        }

      },
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColorDark,
                child: Icon(icon, size: 25.0, color: Colors.white,),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: isBlink ? BlinkText(
                      text,
                      style: const TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),
                      textAlign: TextAlign.center,
                      endColor: Colors.orange,
                      maxLines: 2,
                    ):Text(
                      text,
                      style: const TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  )
                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}

