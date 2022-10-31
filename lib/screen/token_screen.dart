import 'package:flutter/material.dart';

import '../data/requestModel/CodeModel.dart';

class TokenScreen extends StatefulWidget {

  final String nationalityID;
  final String mobileNo;
  final String message;
  final String verificationId;
  final List<CodeModel> labelList;
  const TokenScreen(this.nationalityID, this.mobileNo, this.message, this.verificationId, this.labelList);




  @override
  State<TokenScreen> createState() => _TokenScreenState(nationalityID, mobileNo, message, verificationId);
}

class _TokenScreenState extends State<TokenScreen> {
  final String nationalityID;
  final String mobileNo;
  final String message;
  final String verificationId;


  _TokenScreenState(
      this.nationalityID, this.mobileNo, this.message, this.verificationId);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('this is token screen'),
      ],
    );
  }


}
