import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/controllers/payment_controller.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:foody/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  final String orderID;

  const PaymentScreen({super.key, required this.orderID});

  @override
  State<StatefulWidget> createState() {
    return PaymentScreenState();
  }
}

class PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text Controllers
  final cardPinController = TextEditingController();

  // authController instance
  final authController = Get.find<AuthController>();
  // paymentController instance
  final paymentController = Get.put(PaymentController());

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/bg.png'),
            fit: BoxFit.fill,
          ),
          // color: Colors.black,
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              CreditCardWidget(
                glassmorphismConfig:
                    useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                bankName: 'Bank Name',
                frontCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                backCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: FoodyColors.mainColor,
                // backgroundImage:
                //     useBackgroundImage ? 'assets/card_bg.png' : null,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[
                  // CustomCardTypeIcon(
                  //   cardType: CardType.mastercard,
                  //   cardImage: Image.asset(
                  //     'assets/mastercard.png',
                  //     height: 48,
                  //     width: 48,
                  //   ),
                  // ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: Colors.blue,
                        textColor: Colors.black,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: border,
                          enabledBorder: border,
                        ),
                        expiryDateDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Card Holder',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: _onValidate,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: <Color>[
                                FoodyColors.mainColor,
                                FoodyColors.textFoodyGrey,
                                FoodyColors.mainColor2,
                                FoodyColors.textFoodyblack
                              ],
                              begin: Alignment(-1, -4),
                              end: Alignment(1, 4),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text(
                            'Check out',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card',
                            ),
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

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      // When the atm form is valid, we go on to ask for PIN
      requestCardPinBottomSheet();
    } else {
      // if form is invalid
      authController.showSweetToast(
          message: "Invalid card details", isSuccess: false);
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  // show foody bottom sheet
  void requestCardPinBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding:
            const EdgeInsets.only(left: 30, right: 15, top: 40, bottom: 40),
        height: MediaQuery.of(context).size.height * 0.4,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Card Pin
              TextFieldWidget(
                text: 'Input Card Pin',
                hintText: 'XXXX',
                keyboardType: TextInputType.number,
                inputController: cardPinController,
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 20),
              // Checkout
              FoodyMainButton(
                text: 'Pay Now',
                onTapped: () {
                  var pin = cardPinController.text.trim();
                  var expMonth = expiryDate.substring(0, 2);
                  var expYear = expiryDate.substring(3, 5);
                  var newCardNumber = cardNumber
                      .removeAllWhitespace; // removing all whitespaces

                  if (kDebugMode) print("$expMonth , $expYear ($expiryDate)");

                  if (pin.length == 4 && pin.isNotEmpty) {
                    // calling our function from Payment controller
                    paymentController.createPaymentReference(
                        orderID: widget.orderID,
                        cardNumber: newCardNumber,
                        CVV: cvvCode,
                        expMonth: expMonth,
                        expYear: expYear,
                        atmPin: pin);
                  }
                },
                backgroundColor: FoodyColors.mainColor,
                fontSize: 15,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
