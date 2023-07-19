import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/product_controller.dart';
import 'package:foody/data/api/api_endpoints.dart';
import 'package:foody/data/api/helper_methods.dart';
import 'package:foody/locals/local_data.dart';
import 'package:foody/screens/Intro/onboarding_screen.dart';
import 'package:foody/screens/auth/login_screen.dart';
import 'package:foody/screens/main_pages/home_screen.dart';
import 'package:foody/widgets/progress_dialog.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {

  @override
  void onReady() {    
    startFoodyApp();
    super.onReady();
  }




  // Start Foody App
  Future<void> startFoodyApp() async {
    await Future.delayed(const Duration(seconds: 4));
    // Checking user status
    bool isLoggedIn = await isUserLoggedIn(); 

    // Go to homeScreen or WelcomeScreen when app starts
    if(isLoggedIn){
      Get.offAllNamed(HomeScreen.routeName);
    }else{
      Get.offNamed(OnboardingScreen.routeName);
    }
  }




  // This function registers the user
  Future<void> registerUser(String email, String password) async {
    // progress dialog
    showProgressDialog(message: "Registration in Progress . . .");

    Map<String, String> registrationBody = {
      "username": email,
      "email": email,
      "password1": password,
      "password2": password
    };

    Response response = await HelperAPIMethods.postData(
      uri: FoodyAPI.BASE_URL + FoodyAPI.registrationEndpoint,
      withHeader: false,
      body: registrationBody
    );

    if(response.statusCode==201){
      // saving details to locals
      await saveUserDetailsInLocals(
        token: response.body["access"],
        email: email,
        password: password
      );

      Get.back();
      showSweetToast(message: "Registration successful !");
      // Preview Data stored in the Locals
      await showUserDetailsInLocals();
      // Go to homescreen 
      Get.offAllNamed(HomeScreen.routeName);
    } else{
      Get.back();
      showSweetToast(message: "Registration Failed. Check your details and try again", isSuccess: false);
    }
  }




  // This function logs in the user  
  Future<void> loginUser(String email, String password) async{  
    final prodController = Get.find<ProductController>(); 

    // progress dialog
    showProgressDialog(message: "Logging in; please wait . . .");

    Map<String, String> loginBody = {
      "username": email,
      "email": email,
      "password": password
    };

    Response response = await HelperAPIMethods.postData(
      uri: FoodyAPI.BASE_URL + FoodyAPI.loginEndpoint,
      withHeader: false,
      body: loginBody
    );

    if(response.statusCode==200){
      // saving details to locals
      await saveUserDetailsInLocals(
        token: response.body["access"],
        email: email,
        password: password
      );

      Get.back();
      showSweetToast(message: "Login successful !");
      // Preview Data stored in the Locals
      await showUserDetailsInLocals();
      // Get products and product related data
      await prodController.fetchAllGroceryProducts();
      await prodController.fetchAllProductCategories();
      await prodController.fetchAllOrderedProducts();
      // cart
      prodController.retrieveCartItemsFromLocals();
      // Go to homescreen 
      Get.offAllNamed(HomeScreen.routeName);

    } else{
      Get.back();
      showSweetToast(message: "Login Failed. Check your details and try again", isSuccess: false);
    }
  }
  // This function logs in the user  from backedn
  Future<Response> logoutUserFromBackend() async{  

    Response response = await HelperAPIMethods.postData(
      uri: FoodyAPI.BASE_URL + FoodyAPI.logoutEndpoint,
      withHeader: true,
      body: {}
    );
    return response;
  }


  // Function which saves each user's number and password locally
  Future<void> saveUserDetailsInLocals({String? token, String? email, String? password, String? flwRef, String? orderID}) async {
    final sharedPref = await SharedPreferences.getInstance();
    try{
      if(token != null) await sharedPref.setString(FoodyLocals.TOKEN , token);
      if(email != null) await sharedPref.setString(FoodyLocals.EMAIL, email);
      if(password != null) await sharedPref.setString(FoodyLocals.PASSWORD, password);
      if(flwRef != null) await sharedPref.setString(FoodyLocals.FLW_REF, flwRef);
      if(orderID != null) await sharedPref.setString(FoodyLocals.ORDER_ID, orderID);
    }catch (e){
      if(kDebugMode) print("SHARED_PREFERENCES :::::: Details not saved to the locals");
      throw e;      
    }
  }


  // Function which shows local data
  Future<void> showUserDetailsInLocals() async {
    final sharedPref = await SharedPreferences.getInstance();
    try{
      String? token =  await sharedPref.getString(FoodyLocals.TOKEN);
      String? email =  await sharedPref.getString(FoodyLocals.EMAIL);
      String? password = await sharedPref.getString(FoodyLocals.PASSWORD);
      String? flwRef = await sharedPref.getString(FoodyLocals.FLW_REF);
      String? orderID = await sharedPref.getString(FoodyLocals.ORDER_ID);
      // For testing
      if(kDebugMode) print("USER_EMAIL: $email");
      if(kDebugMode) print("USER_PASSWORD: $password");
      if(kDebugMode) print("TOKEN: $token");
      if(kDebugMode) print("FLW_REF: $flwRef");
      if(kDebugMode) print("ORDER_ID: $orderID");
    }catch (e){
      if(kDebugMode) print("SHARED_PREFERENCES :::::: Details not saved to the locals");     
    }
  }





  // A function checking if user is logged in through the stored TOKEN
  Future<bool> isUserLoggedIn() async {
    final sharedPref = await SharedPreferences.getInstance();
    // sharedPreferences contains token and basic auth?
    return sharedPref.containsKey(FoodyLocals.TOKEN) && sharedPref.containsKey(FoodyLocals.EMAIL) && sharedPref.containsKey(FoodyLocals.PASSWORD); 
  }


  // Function that clears authentication data
   Future<bool> clearSharedData() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove(FoodyLocals.TOKEN);
    sharedPref.remove(FoodyLocals.PASSWORD);
    sharedPref.remove(FoodyLocals.EMAIL);
    sharedPref.remove(FoodyLocals.CART);
    if(kDebugMode) print("AUTH DATA CLEARED SUCCESSFULLY");
    
    return true;
  }

  // Function that clears authentication data
   Future<bool> clearCartDataUponOrder() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove(FoodyLocals.CART);
    if(kDebugMode) print("CART DATA CLEARED SUCCESSFULLY");
    
    return true;
  }



  // Functions that logs out the user
  void logoutUser() async {
    // obtaining response from the main logout method
    var response = await logoutUserFromBackend();

    // checking if logout is successful
    if(response.statusCode==200){
      bool signedOut = await clearSharedData();
      if(signedOut){
        showSweetToast(message: response.body["detail"].toString());
        Future.delayed(const Duration(seconds: 2));
        Get.offAllNamed(LoginScreen.routeName);
      }      
    }else{
      showSweetToast(message: "Logout failed. \nError: ${response.statusText}");
    }

  }



  // Show Feedback to the user
  showSweetToast({ required String message, bool isSuccess=true}){
    return Fluttertoast.showToast(msg:message, backgroundColor: isSuccess? FoodyColors.mainColor : Colors.red);
  }


  bool validateTextInputData({required String text, bool isEmail=false, bool isPassword=false}) {

    if(isEmail){
      if(text.isEmpty){
        showSweetToast(message: 'Email field is empty. Provide your email', isSuccess: false);
        return false;
      }else if(!text.contains('@') || !text.contains('.')){
        showSweetToast(message: 'Invalid email address', isSuccess: false);
        return false;
      }else{
        return true;
      }
    }    

    if(isPassword){
      if(text.isEmpty){
        showSweetToast(message: 'Password field is empty', isSuccess: false);
        return false;
      }else if(text.length < 8){
        showSweetToast(message: 'Password must be at least 8 characters', isSuccess: false);
        return false;
      }else{
        return true;
      }
    }

    if(!isPassword && !isEmail){
      if(text.isEmpty){
        showSweetToast(message: 'Provide a value where necessary', isSuccess: false);
        return false;
      }else{
        return true;
      }
    }

    return false;
  }





  
}