import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/screens/main_pages/home_screen.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaystackPaymentScreen extends StatefulWidget {
  final String ref;
  final String subPaymentUrl;

  const PaystackPaymentScreen(
      {super.key, required this.subPaymentUrl, required this.ref});

  @override
  State<PaystackPaymentScreen> createState() => _PaystackPaymentScreenState();
}

class _PaystackPaymentScreenState extends State<PaystackPaymentScreen> {
  // Creating webview controller
  late WebViewController myWebViewController;

  // // instance of subscription controller
  // var subscriptionController = Get.find<SubscriptionController>();

  // instance of auth controller
  var authController = Get.find<AuthController>();

  // check if condition is verified;
  final isPaymentVerified = false.obs;

  @override
  void initState() {
    // Initializing the webview controller
    myWebViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (kDebugMode) print("Loading: $progress%");
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            authController.showSweetToast(
              message:
                  "Something went wrong! Please, check your internet connectivity",
            );
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel('Toaster',
          onMessageReceived: (JavaScriptMessage message) {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: Text(message.message)));
      })
      ..loadRequest(Uri.parse(widget.subPaymentUrl));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Obx(() {
              return isPaymentVerified.value
                  ? const Icon(Icons.check, color: Colors.white)
                  : IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    );
            }),
            backgroundColor: Colors.green[400],
            elevation: 0,
            title: Text(
              'Pay for your orders',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WebViewWidget(controller: myWebViewController),
          ),
          bottomNavigationBar: StreamBuilder(stream: () async* {
            bool paymentVerified = false;

            // This while loop continues to run the verification API until the users payment is confirmed, then it will stop
            //  Then, user will be able to proceed to home
            // while (true) {
            //   await Future<void>.delayed(const Duration(seconds: 1));
            //   // paymentVerified = await subscriptionController
            //   //     .verifyUserSubscription(widget.subscriptionStatus);

            //   yield {'status': paymentVerified};
            //   if (kDebugMode)
            //     print("Hello, I am trying to verify payment. . .");

            //   // Stop when the verification has returned successfully
            //   if (paymentVerified) {
            //     isPaymentVerified.value = paymentVerified;
            //     break;
            //   }
            // }
          }(), builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (kDebugMode)
                print(
                    "THIS IS THE STATUS from SNAPshot: ${(snapshot.data as Map)['status']}");
              return BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 25.w),
                        child: FoodyMainButton(
                          text: (snapshot.data as Map)['status']
                              ? 'Proceed to Home'
                              : 'Processing . . .',
                          onTapped: (snapshot.data as Map)['status']
                              ? () {
                                  print('SUccessFUL');
                                }
                              : () {},
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // return const BottomAppBar();
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.sp),
                child: FoodyMainButton(
                    text: 'Click to Verify Payment',
                    fontSize: 13.5.sp,
                    onTapped: () {
                      Get.toNamed(HomeScreen.routeName);
                    }),
              );
            }
          })),
    );
  }
}
