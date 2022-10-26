import 'package:blood_bank/utils/CommonLabel.dart';
import 'package:flutter/material.dart';

class AppDialog{
  BuildContext context;

  AppDialog(this.context);

  showConfirmDialog(String header, String title, Function callBackFunction) {
    IconButton cancelButton = IconButton(
        icon: const Icon(
          Icons.cancel,
          color: Colors.red,
          size: 35.0,
        ),
        onPressed: (){
          Navigator.of(context).pop();
        }
    );

    IconButton continueButton = IconButton(
        icon: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35.0,
        ),
        onPressed: (){
          Navigator.of(context).pop();
          callBackFunction();
        }
    );

    AlertDialog alert = AlertDialog(
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.all(0.0),
      title: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5.0),
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Expanded(
              child: Text(
                header,
                style: const TextStyle(color: Colors.white),
              )
            ),
            GestureDetector(
              onTap: (){Navigator.of(context).pop();},
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );  // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> showMessageDialog(String text, {required Function function}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
//          title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(text),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(CommonLabel.commonOk),
                onPressed: () {
                  Navigator.of(context).pop();
                  function();
                },
              ),
            ],
          ),
        );
      },
    );
  }


}