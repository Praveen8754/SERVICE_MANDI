import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static final CustomToast _singleton = new CustomToast._internal();
  FToast? fToast = FToast();

  CustomToast._internal();

  static CustomToast get instance => _singleton;

  void  showMsg(BuildContext context,String msg, Color color) {
    fToast = FToast();
    fToast?.init(context);
    Widget toast = Container(
      margin: EdgeInsets.only(bottom: 50),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color:color,
      ),
      child:  Text(msg,
        style: TextStyle(color: Colors.white),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 4),
    );
  }

}
