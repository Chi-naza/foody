import 'package:flutter/material.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:foody/widgets/header_background.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4CAD73),
      body: SingleChildScrollView(
        child: HeaderBackgroundWidget(
          children: Column(
            children: [
               // IMAGES
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Lady
                  Image.asset(FoodyImages.ladyIntro),
                  SizedBox(width: 10),
                  // Man
                  Image.asset(FoodyImages.manIntro),
                ],
              ),
              SizedBox(height: 50),
              // The Text Before the Button
              SizedBox(
                child: Text(
                  'Foody is a solution for Grocery Shopping; everything you need',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 40),
              // Get Started Button
              FoodyMainButton(
                text: 'Get Started', 
                onTapped: (){
                  print('We will start soon enough !');
                },
              ),                  
            ],
          ),
        ),
      ),
    );
  }
}