import 'package:flutter/material.dart';

class FoodyMainButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onTapped;
  final double fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  
  const FoodyMainButton({super.key, required this.text, this.width=300.0, this.height=55, required this.onTapped, this.fontSize=21.5, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped, 
      child: Text(
        text, // text
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor??Color(0xFF4CAD73),
          fontSize: fontSize, // font size
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size(width, height) // height & width
      ),
    );
  }
}