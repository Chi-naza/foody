import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';

class FoodySplashScreen extends StatelessWidget {
  const FoodySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: FoodyColors.mainColor,
      body: Center(
        child: Text(
          'Onics Store',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}