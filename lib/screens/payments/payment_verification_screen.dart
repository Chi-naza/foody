import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/controllers/payment_controller.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:get/get.dart';

const Color primaryColor = Color(0xFF121212);
const Color accentPurpleColor = Color(0xFF6A53A1);
const Color accentPinkColor = Color(0xFFF99BBD);
const Color accentDarkGreenColor = Color(0xFF115C49);
const Color accentYellowColor = Color(0xFFFFB612);
const Color accentOrangeColor = Color(0xFFEA7A3B);



class PaymentVerificationScreen extends StatefulWidget {
  final String orderID;
  final String flwRef;

  const PaymentVerificationScreen({super.key, required this.orderID, required this.flwRef});
  
  @override
  _PaymentVerificationScreenState createState() => _PaymentVerificationScreenState();
}

class _PaymentVerificationScreenState extends State<PaymentVerificationScreen> {


  String otpCode = "";

  final paymentController = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verification Code",
              style: theme.textTheme.headline4,
            ),
            SizedBox(height: 16),
            Text(
              "We texted you a code",
              style: theme.textTheme.headline6,
            ),
            Text("Please enter it below", style: theme.textTheme.headline6),
            Spacer(flex: 2),
            OtpTextField(
              numberOfFields: 6,
              borderColor: accentPurpleColor,
              focusedBorderColor: accentPurpleColor,
              showFieldAsBox: false,
              borderWidth: 4.0,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                 setState(() {
                  otpCode = verificationCode;
                  print(otpCode);
                });
              }, // end onSubmit
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "This helps us verify every user in our market place",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyText1,
                ),
              ),
            ),
            Center(
              child: Text(
                "Didn't get code?",
                style: theme.textTheme.subtitle1,
              ),
            ),
            Spacer(flex: 3),
             // Checkout
            Align(
              alignment: Alignment.center,
              child: FoodyMainButton(
                text: 'Complete Payment', 
                onTapped: (){
                  if(otpCode.length == 6 && otpCode.isNotEmpty){
                    paymentController.validateUsersPayment(orderID: widget.orderID, flwRef: widget.flwRef, otp: otpCode);
                  }else{
                    authController.showSweetToast(message: "Invalid otp code", isSuccess: false);
                  }
                },
                backgroundColor: FoodyColors.mainColor,
                fontSize: 15,
                textColor: Colors.white,
              ),
            ),     
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

}








