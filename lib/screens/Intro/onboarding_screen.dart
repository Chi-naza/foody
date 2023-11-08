import 'package:flutter/material.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/screens/auth/auth_option_screen.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:foody/widgets/header_background.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String routeName = '/onboarding';

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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Onics Store is a solution for Grocery Shopping; everything you need',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              // Get Started Button
              FoodyMainButton(
                text: 'Get Started',
                onTapped: () {
                  Get.offNamed(AuthOptionsScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
