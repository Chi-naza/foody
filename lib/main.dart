import 'package:flutter/material.dart';
import 'package:foody/screens/Intro/onboarding_screen.dart';
import 'package:foody/screens/auth/login_screen.dart';
import 'package:foody/screens/auth/auth_option_screen.dart';
import 'package:foody/screens/auth/registration_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foody',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF53B97C)),
        fontFamily: GoogleFonts.montserratAlternates().fontFamily,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

