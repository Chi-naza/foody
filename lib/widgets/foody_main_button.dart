import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FoodyMainButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final VoidCallback onTapped;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  
  const FoodyMainButton({super.key, required this.text, this.width, this.height, required this.onTapped, this.fontSize, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped, 
      child: Text(
        text, // text
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor??const Color(0xFF4CAD73),
          fontSize: fontSize??15.sp, // font size
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        fixedSize: Size(width??80.w, height??7.h) // height & width
      ),
    );
  }
}