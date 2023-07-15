import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/screens/auth/registration_screen.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:foody/widgets/header_background.dart';
import 'package:foody/widgets/textfield_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final authController = Get.find<AuthController>();

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
                    'Login',
                    style:  GoogleFonts.inter(
                      fontSize:  27.sp,
                      fontWeight:  FontWeight.w700,
                      height:  1.2058823529,
                      letterSpacing:  0.3740000129,
                      color:  Color(0xffffffff),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  // Image at Login
                  Image.asset(FoodyImages.manIntro),
                ],
              ),
              SizedBox(height: 7.h),
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
                    SizedBox(height: 4.h),
                    // Email Section
                    TextFieldWidget(
                      text: 'password', 
                      hintText: 'your password here',
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      inputController: passwordController,
                    ),
                  ],
                ),
              ),              
              SizedBox(height: 4.h),
              Center(
                child: Container(
                  margin:  EdgeInsets.fromLTRB(255, 0, 2, 18),
                  child: InkWell(
                    onTap: (){},
                    child: Text(
                      'Forgot Password',
                      textAlign:  TextAlign.center,
                      style:  GoogleFonts.inter (
                        fontSize:  12,
                        fontWeight:  FontWeight.w700,
                        height:  1.8,
                        color:  FoodyColors.textFoodyGreen,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              // Login Button
              FoodyMainButton(
                text: 'Login', 
                width: 86.w,
                textColor: Colors.white,
                backgroundColor: FoodyColors.mainColor,
                onTapped: (){
                  var email = emailController.text.trim();
                  var pswd = passwordController.text.trim(); 
                  // if form is valid, then proceed with signIn
                  bool emailValid = authController.validateTextInputData(text: email, isEmail: true);
                  if(!emailValid) return;
                  bool pswdValid = authController.validateTextInputData(text: pswd, isPassword: true);
                  if(!pswdValid) return;
                  
                  // calling registration function if form is valid                       
                  if(emailValid && pswdValid){
                    authController.loginUser(email, pswd);
                  }
                }
              ),
              SizedBox(height: 20),
              Container(
                margin:  EdgeInsets.fromLTRB(79, 0, 78, 0),
                width:  double.infinity,
                child: Row(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Center(
                      child: Container(
                        margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Text(
                          "Don't have an account?",
                          textAlign:  TextAlign.center,
                          style:  GoogleFonts.inter(
                            fontSize:  9.sp,
                            fontWeight:  FontWeight.w400,
                            height:  1.5,
                            color:  FoodyColors.textFoodyGreen,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: (){
                          Get.toNamed(RegistrationScreen.routeName);
                        },
                        child: Text(
                          'Register',
                          textAlign:  TextAlign.center,
                          style:  GoogleFonts.inter(
                            fontSize:  10.sp,
                            fontWeight:  FontWeight.w700,
                            height:  1.5,
                            color:  Color(0xff0eb176),
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
