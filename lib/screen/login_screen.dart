import 'package:blood_bank/controller/login_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../utils/AppConstant.dart';
import '../utils/AppUtils.dart';
import '../utils/ApplicationMemory.dart';
import '../utils/CommonLabel.dart';
import '../utils/TextStore.dart';
import '../utils/dialog/AppToast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    loginController.initData(context);

    if (kDebugMode) {
      print('loading ==  ${loginController.isLoadingLabel.value}');
    }
  }

  @override
  Widget build(BuildContext context) {
    //loginController.isLoadingLabel.value? ApplicationLoader().getListViewLoader() :

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: loginController.loginKey,
          child: Column(
            children: [getHeader(), getLoginComponent(), getFooter()],
          ),
        ),
      ),
    );
  }

// login screen header section
  Widget getHeader() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Image.asset(
              TextStore.img_blood_bank,
              width: 150,
              height: 50,
            ),
            Obx(
              () => Text(
                loginController.loginLblLogin.value,
                style: TextStyle(
                    fontSize: 20.0, color: Theme.of(context).primaryColor),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Obx(
              () => FlutterSwitch(
                width: 85.0,
                // height: 25.0,
                activeText: "English",
                inactiveText: "عربي",
                toggleColor: Colors.white,
                activeColor: Theme.of(context).primaryColor,
                activeTextColor: Colors.white,
                inactiveColor: Theme.of(context).primaryColor,
                inactiveTextColor: Colors.white,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: loginController.isLocalActive.value,
                borderRadius: 20.0,
                padding: 5.0,
                showOnOff: true,
                onToggle: (val) {
                  if (kDebugMode) {
                    print('local == $val');
                  }
                  loginController.isLocalActive.value = val;
                  ApplicationMemory.putString(
                      ApplicationMemory.KEY_LANGUAGE,
                      loginController.isLocalActive.value
                          ? ''
                          : TextStore.common_lang_english);
                  loginController.setLabel();
                  CommonLabel.setLabel(loginController.isLocalActive.value);
                },
              ),
            ),
          ],
        ),
        // WavyHeader(),
      ],
    );
  }

  Widget getLoginComponent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Obx(
                () => Text(
                  loginController.lblNatId.value,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF999A9A)),
                ),
              ),
            ),
            getTextField(true),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Obx(
                () => Text(
                  loginController.lblMobileNo.value,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF999A9A)),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                getTextField(false),
                Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Obx(
                            () => Text(
                              loginController.loginLblEnterMobileAndNID.value,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  color: Color(0xFFA0A0A0), fontSize: 12),
                            ),
                          ),
                        )),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            gradient: LinearGradient(
                              colors: AppConstant.appGradients,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              if (loginController.loginKey.currentState!
                                  .validate()) {
                                String nid = loginController.nidController.text
                                    .toString();
                                String mobile = loginController
                                    .mobileNoController.text
                                    .toString();
                                FocusScope.of(context).unfocus();
                                if (await AppUtils.checkConnection()) {
                                  AppToast(context).showToast('login success',
                                      AppToast.SUCCESS, AppToast.LONG);
                                  loginController.login(
                                      context,
                                      nid,
                                      mobile,
                                      loginController.labelList,
                                      loginController.isLocalActive);
                                } else {
                                  AppToast(context).showToast(
                                      CommonLabel.commonCheckConnection,
                                      AppToast.ERROR,
                                      AppToast.LONG);
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextField(isNid) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, bottom: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        child: Material(
          elevation: 10,
          color: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0.0),
                  topRight: Radius.circular(30.0))),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
            child: TextFormField(
              keyboardType: isNid ? TextInputType.number : TextInputType.phone,
              controller: isNid
                  ? loginController.nidController
                  : loginController.mobileNoController,
              validator: (value) {
                if (value!.isEmpty) {
                  return CommonLabel.commonEmptyField;
                } else if (value.length < 10) {
                  return loginController.loginLbl10DigitRequired.value;
                }
                return null;
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: isNid
                      ? TextStore.login_nid_mask
                      : TextStore.login_mobile_no_mask,
                  hintStyle:
                      const TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
            ),
          ),
        ),
      ),
    );
  }

  Widget getFooter() {
    return Container(
        padding: const EdgeInsets.all(5.0),
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 8.0,
              color: Colors.grey,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: 'Copyright : ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent)),
              TextSpan(
                  text:
                      "This product is protected by copyright law and international treaties. Unauthorized reproduction and distribution of this program, or any portion of it, may result in severe civil and criminal penalties and will be prosecuted to the maximum extent possible under the law.",
                  style: TextStyle(fontSize: 12, color: Colors.black)),
            ],
          ),
        ));
  }
}
