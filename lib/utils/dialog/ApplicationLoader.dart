import 'package:blood_bank/utils/CommonLabel.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ApplicationLoader{

  static apiRequestLoader(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 10),child:Text(CommonLabel.commonLoaderText)),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  Widget getListViewLoader(){
    double containerWidth = 280;
    double containerHight = 15;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey,
              child: Container(
                margin:  const EdgeInsets.symmetric(horizontal: 7.5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: containerHight,
                            width: containerWidth,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            height: containerHight,
                            width: containerWidth,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            height: containerHight,
                            width: containerWidth * .75,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
