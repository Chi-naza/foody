import 'package:dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:get/get.dart';

showChoiceDialog({required String title, required String message, required VoidCallback okOnPressed}){
  final choice = ChoiceDialog(
    dialogBackgroundColor: Colors.white,
    title: title,
    message: message,
    buttonOkColor: FoodyColors.mainColor2,
    buttonOkOnPressed: okOnPressed,
  );
  choice.show(Get.context);
}