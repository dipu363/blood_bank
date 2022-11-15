import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/token_controller.dart';
import '../data/requestModel/CodeModel.dart';
import '../utils/AppConstant.dart';
import '../utils/AppUtils.dart';
import '../utils/CommonLabel.dart';
import '../utils/dialog/AppToast.dart';

class TokenScreen extends StatefulWidget {
  final String nationalityID;
  final String mobileNo;
  final String verificationId;
  final List<CodeModel> labelList;

  TokenScreen(
      this.nationalityID, this.mobileNo, this.verificationId, this.labelList);

  @override
  State<TokenScreen> createState() => _TokenScreenState();
}

class _TokenScreenState extends State<TokenScreen> {

  /*================= BODY =====================*/
  @override
  Widget build(BuildContext context) {

    TokenController tController = Get.put(TokenController(widget.labelList));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: tController.tokenKey,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(()=>Text(
                      "${tController.loginLblActivationCode} - ${widget.verificationId}",
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Obx(()=> Text(tController.loginLblEnterActivationCode.value)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: TextFormField(
                      controller: tController.textToken,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return CommonLabel.commonEmptyField;
                        }
                        return null;
                      },
                      maxLength: 4,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (tController.tokenKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        if (await AppUtils.checkConnection()) {
                          tController.checkActivationCode(
                              widget.nationalityID,
                              widget.mobileNo,
                              tController.textToken.text.toString());
                        } else {
                          AppToast(context).showToast(
                              CommonLabel.commonCheckConnection,
                              AppToast.ERROR,
                              AppToast.LONG);
                        }
                      }
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: AppConstant.appGradients,
                        ),
                      ),
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                            child: Obx(()=>Text(tController.loginLblVerify.value,
                            style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
