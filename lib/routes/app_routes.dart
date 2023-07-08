import 'package:foody/screens/Intro/onboarding_screen.dart';
import 'package:foody/screens/Intro/splash_screen.dart';
import 'package:foody/screens/auth/auth_option_screen.dart';
import 'package:foody/screens/auth/login_screen.dart';
import 'package:foody/screens/auth/registration_screen.dart';
import 'package:foody/screens/main_pages/home_screen.dart';
import 'package:get/get.dart';


class AppRoutes {

  static List<GetPage> routes = [
    // splash screen
    GetPage(
      name: '/',
      page: () => const FoodySplashScreen(),
      transition: Transition.fadeIn, 
      transitionDuration: const Duration(seconds: 5),           
    ),
    // Get Started Screen
    GetPage(
      name: OnboardingScreen.routeName,
      page: () => const OnboardingScreen(),
      transition: Transition.fade,           
    ),
    // Login Screen
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),     
    ),
    // Registration Screen
    GetPage(
      name: RegistrationScreen.routeName,
      page: () => const RegistrationScreen(),   
    ),
    // Home Screen
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(), 
      transition: Transition.fade,    
    ),
    // Auth Options Screen
    GetPage(
      name: AuthOptionsScreen.routeName,
      page: () => const AuthOptionsScreen(), 
      transition: Transition.fade,    
    ),
  ];

}