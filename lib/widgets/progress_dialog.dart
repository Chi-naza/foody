import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDialogWidget extends StatelessWidget {
  final String message;
  
  const ProgressDialogWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // backgroundColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const SizedBox(width: 6.0,),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              const SizedBox(width: 26.0,),
              Text(
                message,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// A Function which shows the Progress Dialog Widget
showProgressDialog({required String message}){
  return showDialog(
    context: Get.context!, 
    barrierDismissible: false,
    builder: (context) => ProgressDialogWidget(message: message),
  );
}