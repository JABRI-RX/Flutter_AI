import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';


void showToast(BuildContext context,String text,Color bgcolor,ToastificationType type){
  toastification.show(
    backgroundColor: bgcolor ,
    context: context,
    type: type,
    style: ToastificationStyle.flat,
    title:  Text(text),
    // description: Text("Component updates available."),
    alignment: Alignment.topLeft,
    autoCloseDuration: const Duration(seconds: 3),
    pauseOnHover: false,
  );
}