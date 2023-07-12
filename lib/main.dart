import 'package:flutter/material.dart';
import 'package:foody/bindings/custom_app_bindings.dart';
import 'package:foody/routes/app_routes.dart';
import 'package:foody/screens/Intro/onboarding_screen.dart';
import 'package:foody/screens/Intro/splash_screen.dart';
import 'package:foody/screens/test_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CustomAppBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Foody',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF53B97C)),
        fontFamily: GoogleFonts.montserratAlternates().fontFamily,
        useMaterial3: true,
      ),
      getPages: AppRoutes.routes,
      // home: TestScreen(),
    );
  }

}

