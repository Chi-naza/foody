import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/controllers/product_controller.dart';
import 'package:foody/data/api/api_endpoints.dart';
import 'package:foody/models/create_order_model.dart';
import 'package:foody/screens/main_pages/category_detail_screen.dart';
import 'package:foody/screens/payments/payment_screen.dart';
import 'package:foody/screens/payments/paystack_payment_screen.dart';
import 'package:foody/widgets/cart_item_widget.dart';
import 'package:foody/widgets/foody_main_button.dart';
import 'package:foody/widgets/option_dialog.dart';
import 'package:foody/widgets/textfield_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "/cart";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final productController = Get.find<ProductController>();
  final authController = Get.find<AuthController>();

  // Text Controllers
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final phoneNumberController = TextEditingController();

  // Request for bike option bool
  bool requestForBike = false;

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    postalCodeController.dispose();
    cityController.dispose();
    stateController.dispose();
    phoneNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Obx(() {
            // if cart is empty
            return productController.cartProductsList.isEmpty
                ? Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.23),
                          Image.asset(
                            FoodyImages.emptyCartImage,
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'My Cart',
                            style: TextStyle(
                              color: FoodyColors.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // List of CART ITEMS here
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.58,
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            var cartItem =
                                productController.cartProductsList[index];
                            var total = cartItem.quantity *
                                double.parse(cartItem.product.discountPrice);
                            return InkWell(
                              onTap: () {
                                Get.to(CategoryDetailScreen(
                                    product: cartItem.product));
                              },
                              child: CartItemWidget(
                                productName: cartItem.product.name,
                                productIndex: index,
                                quantity: cartItem.quantity,
                                totalPrice: productController
                                    .formatToMoney(total.toString()),
                                image: cartItem.product.image,
                              ),
                            );
                          },
                          itemCount: productController.cartProductsList.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(),
                            );
                          },
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Text(
                                'Items : ${productController.cartProductsList.length}',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                  "# ${productController.calculateCartProductsTotalPrice()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    fontSize: 12.sp,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.5),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            showChoiceDialog(
                                title: 'Make an Order',
                                message:
                                    'You want to continue with your order?',
                                okOnPressed: () {
                                  Get.back();
                                  //Show bottom sheet
                                  showFoodyBottomSheet();
                                  // productController.makePaystackPayment(
                                  //     'ca345ebf-2bfd-4f1d-8643-6d3aeaf6b7ba');
                                  // productController.validatePaystackPayment(
                                  //     orderID:
                                  //         'ca345ebf-2bfd-4f1d-8643-6d3aeaf6b7ba',
                                  //     ref: 'tdidgjugm8');
                                  // productController.getDetailsOfAnOrder(
                                  //     'ca345ebf-2bfd-4f1d-8643-6d3aeaf6b7ba');
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 7.h),
                            backgroundColor: FoodyColors.mainColor2,
                            foregroundColor: Colors.white,
                            elevation: 15,
                          ),
                          child: const Text(
                            'Check Out',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30)
                    ],
                  );
          }),
        ),
      ),
    );
  }

  // show foody bottom sheet
  void showFoodyBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding:
            const EdgeInsets.only(left: 30, right: 15, top: 40, bottom: 40),
        height: MediaQuery.of(context).size.height * 0.7,
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
              // First name
              TextFieldWidget(
                text: 'first name',
                hintText: 'your first name here',
                keyboardType: TextInputType.text,
                inputController: firstNameController,
              ),
              const SizedBox(height: 20),
              // First name
              TextFieldWidget(
                text: 'last name',
                hintText: 'your last name here',
                keyboardType: TextInputType.text,
                inputController: lastNameController,
              ),
              const SizedBox(height: 20),
              // Email Section
              TextFieldWidget(
                text: 'email',
                hintText: 'yourmail@mail.com',
                keyboardType: TextInputType.emailAddress,
                inputController: emailController,
              ),
              const SizedBox(height: 20),
              // Address
              TextFieldWidget(
                text: 'address',
                hintText: 'your address',
                keyboardType: TextInputType.text,
                inputController: addressController,
              ),
              const SizedBox(height: 20),
              // Postal Code
              TextFieldWidget(
                text: 'postal code',
                hintText: 'your postal code',
                keyboardType: TextInputType.number,
                inputController: postalCodeController,
              ),
              const SizedBox(height: 20),
              // City
              TextFieldWidget(
                text: 'city',
                hintText: 'your current city',
                keyboardType: TextInputType.text,
                inputController: cityController,
              ),
              const SizedBox(height: 20),
              // State
              TextFieldWidget(
                text: 'state',
                hintText: 'your state',
                keyboardType: TextInputType.text,
                inputController: stateController,
              ),
              const SizedBox(height: 20),
              // phone number
              TextFieldWidget(
                text: 'phone number',
                hintText: 'your phone number',
                keyboardType: TextInputType.phone,
                isDoneTypeing: true,
                inputController: phoneNumberController,
              ),
              const SizedBox(height: 30),
              // The request Bike Check box
              StatefulBuilder(builder: (context, setState) {
                return CheckboxListTile(
                  title: const Text(
                    "Request for Bike",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  value: requestForBike,
                  onChanged: (newValue) {
                    setState(() {
                      requestForBike = newValue!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                );
              }),
              const SizedBox(height: 20),
              // Pay With Flutterwave
              FoodyMainButton(
                text: 'Pay With PayStack',
                onTapped: () {
                  var fName = firstNameController.text.trim();
                  var lName = lastNameController.text.trim();
                  var email = emailController.text.trim();
                  var address = addressController.text.trim();
                  var city = cityController.text.trim();
                  var postalCode = postalCodeController.text.trim();
                  var state = stateController.text.trim();
                  var phone = phoneNumberController.text.trim();

                  if (fName.isEmpty ||
                      lName.isEmpty ||
                      email.isEmpty ||
                      address.isEmpty ||
                      city.isEmpty ||
                      postalCode.isEmpty ||
                      state.isEmpty ||
                      phone.isEmpty) {
                    authController.showSweetToast(
                        message:
                            "Wrong or empty fields. Kindly fill it properly and try agaain",
                        isSuccess: false);
                  } else {
                    List<CartModel> cartList = [];

                    for (var co in productController.cartProductsList) {
                      // instance of cartModel
                      var cartModel = CartModel(
                          productId: co.product.id.toString(),
                          quantity: co.quantity,
                          price: co.price);
                      // adding each cartModel obj created to the li
                      cartList.add(cartModel);
                    }

                    List<Map<String, dynamic>> cartModelReborn = [];
                    for (var n in cartList) {
                      cartModelReborn.add({
                        "product_id": n.productId.toString(),
                        "quantity": n.quantity,
                        "price": n.price,
                      });
                    }

                    if (cartList.isEmpty) {
                      authController.showSweetToast(
                          message: "Error: No item in the cart",
                          isSuccess: false);
                    } else {
                      // an instance of Create Order Model
                      final cOderModel = CreateOrderModel(
                          cart: cartModelReborn,
                          firstName: fName,
                          lastName: lName,
                          email: email,
                          address: address,
                          postalCode: postalCode,
                          city: city,
                          state: state,
                          phoneNumber: phone);

                      if (kDebugMode) {
                        print("ORDER OBJECT CREATED - PayStack: $cOderModel");
                      }

                      // calling our method
                      productController.makeAnOrder(
                        createOrderModel: cOderModel,
                        isFlutterWave: false,
                      );
                    }
                  }
                },
                backgroundColor: Colors.blueAccent,
                fontSize: 11.5.sp,
                textColor: Colors.white,
              ),
              SizedBox(height: 5.h),
              // Pay With Flutterwave
              FoodyMainButton(
                text: 'Pay With Flutterwave',
                onTapped: () {
                  var fName = firstNameController.text.trim();
                  var lName = lastNameController.text.trim();
                  var email = emailController.text.trim();
                  var address = addressController.text.trim();
                  var city = cityController.text.trim();
                  var postalCode = postalCodeController.text.trim();
                  var state = stateController.text.trim();
                  var phone = phoneNumberController.text.trim();

                  if (fName.isEmpty ||
                      lName.isEmpty ||
                      email.isEmpty ||
                      address.isEmpty ||
                      city.isEmpty ||
                      postalCode.isEmpty ||
                      state.isEmpty ||
                      phone.isEmpty) {
                    authController.showSweetToast(
                      message:
                          "Wrong or empty fields. Kindly fill it properly and try agaain",
                      isSuccess: false,
                    );
                  } else if (3 > 4) {
                    List<CartModel> cartList = [];

                    for (var co in productController.cartProductsList) {
                      // instance of cartModel
                      var cartModel = CartModel(
                          productId: co.product.id.toString(),
                          quantity: co.quantity,
                          price: co.price);
                      // adding each cartModel obj created to the li
                      cartList.add(cartModel);
                    }

                    List<Map<String, dynamic>> cartModelReborn = [];
                    for (var n in cartList) {
                      cartModelReborn.add({
                        "product_id": n.productId.toString(),
                        "quantity": n.quantity,
                        "price": n.price,
                      });
                    }

                    if (cartList.isEmpty) {
                      authController.showSweetToast(
                          message: "Error: No item in the cart",
                          isSuccess: false);
                    } else {
                      // an instance of Create Order Model
                      final cOderModel = CreateOrderModel(
                          cart: cartModelReborn,
                          firstName: fName,
                          lastName: lName,
                          email: email,
                          address: address,
                          postalCode: postalCode,
                          city: city,
                          state: state,
                          phoneNumber: phone);

                      if (kDebugMode) {
                        print(
                            "ORDER OBJECT CREATED - FlutterWave: $cOderModel");
                      }

                      // calling our method
                      productController.makeAnOrder(
                        createOrderModel: cOderModel,
                        isFlutterWave: true,
                      );
                    }
                  } else {
                    authController.showSweetToast(
                      message: "This payment option is no longer available",
                      isSuccess: false,
                    );
                  }
                },
                backgroundColor: Colors.redAccent,
                fontSize: 11.5.sp,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
