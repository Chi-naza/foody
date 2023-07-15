import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:sizer/sizer.dart';

class FoodySplashScreen extends StatelessWidget {
  const FoodySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodyColors.mainColor,
      body: Center(
        child: Text(
          'Onics Store',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}