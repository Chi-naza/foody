import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:foody/widgets/header_background.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthOptionsScreen extends StatefulWidget {
  const AuthOptionsScreen({super.key});

  @override
  State<AuthOptionsScreen> createState() => _AuthOptionsScreenState();
}

class _AuthOptionsScreenState extends State<AuthOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: HeaderBackgroundWidget(
          children: Column(
            children: [
              // Man, Woman + Shopping  Cart
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 40),
                child: Image.asset(FoodyImages.personsNshoppingCart),
              ),
              SizedBox(height: 40),
              // Login Button
              FoodyMainButton(
                text: 'Login', 
                width: 370,
                textColor: Colors.white,
                backgroundColor: FoodyColors.mainColor,
                onTapped: (){}
              ),
              SizedBox(height: 30),
              // Register Outline Button
              InkWell(
                onTap: (){
                  print('Going to Registration Screen!');
                },
                child: Container(
                  width:  370,
                  height:  54,
                  decoration:  BoxDecoration (
                    border:  Border.all(color: Color(0xff4bad73)),
                    borderRadius:  BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Center(
                      child: Text(
                        'Register',
                        textAlign:  TextAlign.center,
                        style:  GoogleFonts.inter(
                          fontSize:  18,
                          fontWeight:  FontWeight.w600,
                          height:  1.2125,
                          color:  FoodyColors.mainColor3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // OR SIGN IN WITH . . .
              Container(
                width: 370,
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    // Line 1
                    Container(
                      margin:  EdgeInsets.fromLTRB(0, 1, 10.6, 0),
                      width:  120.4,
                      height:  1,
                      decoration:  BoxDecoration (
                        color:  Color(0xff828282),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin:  EdgeInsets.fromLTRB(0, 0, 9.6, 0),
                        child: Text(
                          'Or login with',
                          textAlign:  TextAlign.center,
                          style:  GoogleFonts.inter(
                            fontSize:  12,
                            fontWeight:  FontWeight.w400,
                            height:  1.5,
                            color:  Color(0xff333333),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // Line 2
                      margin:  EdgeInsets.fromLTRB(0, 1, 0, 0),
                      width:  120.4,
                      height:  1,
                      decoration:  BoxDecoration (
                        color:  Color(0xff828282),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Sign In With Google 
              InkWell(
                onTap: (){
                  print('Signed In To Google: Successful');
                },
                child: Container(
                  width:  370,
                  height: 50,
                  decoration:  BoxDecoration (
                    border:  Border.all(color: Color(0xffbdbdbd)),
                    borderRadius:  BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      // Container With Google Image
                      SizedBox(width: 20),
                      Container(
                        margin:  EdgeInsets.fromLTRB(0, 0, 105.41, 0),
                        width:  17.59,
                        height:  18,
                        child: Image.asset(
                          FoodyImages.google_icon,
                          width:  17.59,
                          height:  18,
                        ),
                      ),
                      Center(
                        child: Container(
                          margin:  EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text(
                            'Google',
                            textAlign:  TextAlign.center,
                            style:  GoogleFonts.inter(
                              fontSize:  15,
                              fontWeight:  FontWeight.w500,
                              height:  1.2125,
                              color:  Color(0xff4f4f4f),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              // SIGN IN with Facebook
              InkWell(
                onTap: (){
                  print('Hello, . . .signing in with facebook!');
                },
                child: Container(
                  width:  370,
                  height: 50,
                  decoration:  BoxDecoration (
                    color:  Color(0xff2d9cdb),
                    borderRadius:  BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 18),
                      // Facebook Image
                      Container(
                        margin:  EdgeInsets.fromLTRB(0, 0, 105.41, 0),
                        child: Icon(
                          Icons.facebook,
                          size:  25,
                          color: Colors.white,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Facebook',
                          textAlign:  TextAlign.center,
                          style:  GoogleFonts.inter(
                            fontSize:  14,
                            fontWeight:  FontWeight.w500,
                            height:  1.2125,
                            color:  Color(0xffffffff),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}