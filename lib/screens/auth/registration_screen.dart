import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/screens/auth/login_screen.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:foody/widgets/header_background.dart';
import 'package:foody/widgets/textfield_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String routeName = '/registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final authController = Get.find<AuthController>();

  bool hideText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: HeaderBackgroundWidget(
          children: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: GoogleFonts.inter(
                      fontSize: 27.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.2058823529,
                      letterSpacing: 0.3740000129,
                      color: Color(0xffffffff),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  // Image at Login
                  Image.asset(FoodyImages.manIntro),
                ],
              ),
              SizedBox(height: 20),
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
                    const SizedBox(height: 30),
                    // Email Section
                    TextFieldWidget(
                      text: 'password',
                      hintText: '1 uppercase, 1 lowercase, a number & symbol',
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
              Align(
                alignment: Alignment.centerLeft,
                child: Opacity(
                  opacity: 0.5,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, top: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: Text(
                            "Password Must Have:",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w900,
                              height: 1.5,
                              color: FoodyColors.textFoodyGreen,
                            ),
                          ),
                        ),
                        // uppercase
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: Text(
                            "1 Uppercase letter",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: FoodyColors.textFoodyGreen,
                            ),
                          ),
                        ),
                        // lower case
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: Text(
                            "1 Lowercase letter",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: FoodyColors.textFoodyGreen,
                            ),
                          ),
                        ),
                        // 1 Number
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: Text(
                            "1 Number",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: FoodyColors.textFoodyGreen,
                            ),
                          ),
                        ),
                        // 1 special character
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: Text(
                            "1 Special character",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: FoodyColors.textFoodyGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // Register Button
              FoodyMainButton(
                  text: 'Register',
                  width: 86.w,
                  textColor: Colors.white,
                  backgroundColor: FoodyColors.mainColor,
                  onTapped: () {
                    var email = emailController.text.trim();
                    var pswd = passwordController.text.trim();

                    // if form is valid, then proceed with signIn
                    bool emailValid = authController.validateTextInputData(
                        text: email, isEmail: true);
                    if (!emailValid) return;

                    bool pswdValid = authController.validateTextInputData(
                        text: pswd, isPassword: true);
                    if (!pswdValid) return;

                    // more pswd check
                    if (!authController.validateUserPassword(pswd)) {
                      authController.showSweetToast(
                        message: "Password is not strong enough.",
                        isSuccess: false,
                      );
                      return;
                    }

                    // calling registration function if form is valid
                    if (emailValid && pswdValid) {
                      // authController.registerUser(email, pswd);
                      print('Yes');
                    }
                  }),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Text(
                        "Already have an account?",
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
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(LoginScreen.routeName);
                      },
                      child: Text(
                        'Login Here',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color(0xff0eb176),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
