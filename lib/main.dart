import 'package:flutter/material.dart';
import 'package:foody/bindings/custom_app_bindings.dart';
import 'package:foody/routes/app_routes.dart';
import 'package:foody/screens/auth/reset_confirm_pswd.dart';
import 'package:foody/screens/auth/reset_pswd_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

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
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Onics Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF53B97C)),
          fontFamily: GoogleFonts.montserratAlternates().fontFamily,
          useMaterial3: true,
        ),
        getPages: AppRoutes.routes,
        // home: const ConfirmPswdResetScreen(),
      );
    });
  }
}
