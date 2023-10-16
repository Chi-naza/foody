import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:foody/widgets/header_background.dart';
import 'package:foody/widgets/textfield_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ResetPswdScreen extends StatefulWidget {
  const ResetPswdScreen({super.key});

  static const String routeName = '/reset-pswd';

  @override
  State<ResetPswdScreen> createState() => _ResetPswdScreenState();
}

class _ResetPswdScreenState extends State<ResetPswdScreen> {
  final emailController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: HeaderBackgroundWidget(
          heightBtwTextnChildren: 7.h,
          containerSize: 35.h,
          children: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reset Password',
                    style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.2058823529,
                      letterSpacing: 0.3740000129,
                      color: Color(0xffffffff),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  // Image at Login
                  // Image.asset(FoodyImages.manIntro),
                ],
              ),
              SizedBox(height: 14.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    // Email Section
                    TextFieldWidget(
                      text: 'email',
                      hintText: 'yourmail@mail.com',
                      keyboardType: TextInputType.emailAddress,
                      inputController: emailController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.h),
              // Login Button
              FoodyMainButton(
                  text: 'Continue',
                  width: 86.w,
                  textColor: Colors.white,
                  backgroundColor: FoodyColors.mainColor,
                  onTapped: () {
                    var email = emailController.text.trim();
                    // if form is valid, then proceed with reset
                    bool emailValid = authController.validateTextInputData(
                        text: email, isEmail: true);
                    if (!emailValid) return;

                    // calling reset password function if form is valid
                    if (emailValid) {
                      authController.sendResetPswdOTP(email);
                    }
                  }),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.fromLTRB(79, 0, 78, 0),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Text(
                          "Continue to receive reset password otp",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: FoodyColors.textFoodyGreen,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
