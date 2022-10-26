import 'package:flutter/material.dart';

class AppConstant{

  // static int currentState = 4;

  static const List<Color> appGradients = [
   /*Color(0xccB40422),
    Color(0xffB40404),
    Color(0xffB40404),*/
    Color(0xffB40404),
    Color(0xccB40422),
  ];

  static const InputDecoration textFieldDecoration = InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    border: OutlineInputBorder(),
    counterText: "",
  );

  static const TextStyle textFieldLabelStyle = TextStyle(
      fontSize: 15.0,
      color: Colors.black87
  );

  /*static LinearGradient getAppGradient(){
    return LinearGradient(
        colors: [
          Color(0xffB40404),
          Color(0xccB40422),
        ]
    );
  }*/

}