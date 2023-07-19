import 'package:flutter/foundation.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/data/api/api_endpoints.dart';
import 'package:foody/data/api/helper_methods.dart';
import 'package:foody/screens/main_pages/home_screen.dart';
import 'package:foody/screens/payments/payment_screen.dart';
import 'package:foody/screens/payments/payment_verification_screen.dart';
import 'package:foody/widgets/progress_dialog.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {

  final authController = Get.find<AuthController>();


  // This method starts the payment process for the user making an order
  Future<void> createPaymentReference({required String orderID, required String cardNumber, required String CVV, required String expMonth, required String expYear, required String atmPin}) async {
    Get.back(); // closing the bottomsheet
    
    showProgressDialog(message: 'Processing payment . . .');

    Map<String, String> paymentRefBody = {
      "cardno": cardNumber,
      "cvv": CVV,
      "expirymonth": expMonth,
      "expiryyear": expYear,
      "pin": atmPin
    };

    Response response = await HelperAPIMethods.postData(
      uri: FoodyAPI.BASE_URL + FoodyAPI.paymentFormEndpoint(orderID),
      withHeader: true,
      body: paymentRefBody,
    );


    if(response.statusCode==200){
      // saving payment reference to locals
      await authController.saveUserDetailsInLocals(
        flwRef: response.body["flwRef"]
      );

      if(kDebugMode) print("STARTING PAYMENT DETAILS : ${response.body}");

      // Preview Data stored in the Locals
      await authController.showUserDetailsInLocals();

      Get.back(); // stopping loading

      // Go to payment verification
      Get.to(PaymentVerificationScreen(orderID: orderID, flwRef: response.body["flwRef"].toString()));
    } else{
      authController.showSweetToast(message: "Payment failed", isSuccess: false);
    }
  }





  // This method starts the payment process for the user making an order
  Future<void> validateUsersPayment({required String orderID, required String flwRef, required String otp}) async {

    showProgressDialog(message: 'Validating your payment . . .');

    Map<String, String> validationBody = {
      "otp": otp,
    };

    Response response = await HelperAPIMethods.postData(
      uri: FoodyAPI.BASE_URL + FoodyAPI.validatePaymentEndpoint(orderID, flwRef),
      withHeader: true,
      body: validationBody,
    );

    if(kDebugMode)print(response.statusCode);

    if(response.statusCode==200 && response.body["status"] =="success"){
   
      if(kDebugMode) print("VALIDATED PAYMENT DETAILS : ${response.body}");

      Get.back(); // stopping loading

      authController.showSweetToast(message: "Payment successful");
       await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed(HomeScreen.routeName);
    } else{
      authController.showSweetToast(message: "Payment failed", isSuccess: false);
      await Future.delayed(const Duration(seconds: 2));
      Get.to(PaymentScreen(orderID: orderID));
    }
  }




}