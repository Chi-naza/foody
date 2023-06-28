import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:foody/widgets/header_background.dart';
import 'package:foody/widgets/textfield_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      fontSize:  34,
                      fontWeight:  FontWeight.w700,
                      height:  1.2058823529,
                      letterSpacing:  0.3740000129,
                      color:  Color(0xffffffff),
                    ),
                  ),
                  SizedBox(width: 60),
                  // Image at Login
                  Image.asset(FoodyImages.manIntro),
                ],
              ),
              SizedBox(height: 20),
              // Email Section
              const TextFieldWidget(
                text: 'email', 
                hintText: 'yourmail@mail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              // Email Section
              const TextFieldWidget(
                text: 'password', 
                hintText: 'your password here',
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  margin:  EdgeInsets.fromLTRB(255, 0, 0, 18),
                  child: InkWell(
                    onTap: (){
                      print('You forgot your password');
                    },
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
              SizedBox(height: 30),
              // Login Button
              FoodyMainButton(
                text: 'Login', 
                width: 370,
                textColor: Colors.white,
                backgroundColor: FoodyColors.mainColor,
                onTapped: (){}
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
                            fontSize:  12,
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
                          print('Go to register screen');
                        },
                        child: Text(
                          'Register',
                          textAlign:  TextAlign.center,
                          style:  GoogleFonts.inter(
                            fontSize:  12,
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
