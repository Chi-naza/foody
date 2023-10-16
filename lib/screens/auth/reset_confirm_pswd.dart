import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:foody/widgets/header_background.dart';
import 'package:foody/widgets/textfield_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ConfirmPswdResetScreen extends StatefulWidget {
  const ConfirmPswdResetScreen({super.key});

  static const String routeName = '/confirm-pswd-reset';

  @override
  State<ConfirmPswdResetScreen> createState() => _ConfirmPswdResetScreenState();
}

class _ConfirmPswdResetScreenState extends State<ConfirmPswdResetScreen> {
  final otpController = TextEditingController();
  final passwordController = TextEditingController();

  final authController = Get.find<AuthController>();

  bool hideText = true;

  @override
  void dispose() {
    otpController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: HeaderBackgroundWidget(
          heightBtwTextnChildren: 5.h,
          containerSize: 35.h,
          children: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Complete\nPassword Reset',
                    style: GoogleFonts.inter(
                      fontSize: 23.sp,
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
                      text: 'verification code',
                      hintText: 'eg. 7373',
                      keyboardType: TextInputType.number,
                      inputController: otpController,
                    ),
                    SizedBox(height: 4.h),
                    // Email Section
                    TextFieldWidget(
                      text: 'new Password',
                      hintText: 'your new password here',
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: hideText,
                      isDoneTypeing: true,
                      inputController: passwordController,
                      suffixIcon: IconButton(
                        onPressed: () => setState(() {
                          hideText = !hideText;
                        }),
                        icon: hideText
                            ? Icon(
                                Icons.visibility_off,
                                color: FoodyColors.mainColor,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.red,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.h),
              // Login Button
              FoodyMainButton(
                  text: 'Complete Reset',
                  width: 86.w,
                  textColor: Colors.white,
                  backgroundColor: FoodyColors.mainColor,
                  onTapped: () {
                    var otp = otpController.text.trim();
                    var pswd = passwordController.text.trim();
                    // if form is valid, then proceed reset password completion
                    bool otpValid =
                        authController.validateTextInputData(text: otp);
                    if (!otpValid) return;
                    bool pswdValid = authController.validateTextInputData(
                        text: pswd, isPassword: true);
                    if (!pswdValid) return;

                    // calling reset password complete function if form is valid
                    if (otpValid && pswdValid) {
                      authController.completePswdReset(newPswd: pswd, otp: otp);
                    }
                  }),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.fromLTRB(79, 0, 78, 0),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Text(
                          "Complete the reset password process",
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
