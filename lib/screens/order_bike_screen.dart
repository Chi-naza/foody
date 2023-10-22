import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/controllers/delivery_controller.dart';
import 'package:foody/widgets/option_dialog.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../widgets/textfield_widget.dart';

class OrderBikeScreen extends StatefulWidget {
  final String? prodDescription;
  const OrderBikeScreen({super.key, this.prodDescription});

  @override
  State<OrderBikeScreen> createState() => _OrderBikeScreenState();
}

class _OrderBikeScreenState extends State<OrderBikeScreen> {
  final deliveryController = Get.find<DeliveryController>();
  final authController = Get.find<AuthController>();

  // Text Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final itemDescController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    itemDescController.dispose();
    cityController.dispose();
    stateController.dispose();
    phoneNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (deliveryController.allBikeDeliveriesList.isNotEmpty) {
      var data = deliveryController.allBikeDeliveriesList.first;

      firstNameController.text = data.firstName!;
      lastNameController.text = data.lastName!;
      addressController.text = data.destinationAddress!;
      cityController.text = data.destinationCity!;
      stateController.text = data.destinationState!;
      phoneNumberController.text = data.alternativePhoneNumber!;

      if (widget.prodDescription != null) {
        itemDescController.text = widget.prodDescription!;
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Request for Bike',
                  style: TextStyle(
                    color: FoodyColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            const Divider(),
            SizedBox(height: 4.h),
            // text fields
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  // First name
                  TextFieldWidget(
                    text: 'first name',
                    hintText: 'your first name here',
                    keyboardType: TextInputType.text,
                    inputController: firstNameController,
                  ),
                  SizedBox(height: 3.h),
                  // First name
                  TextFieldWidget(
                    text: 'last name',
                    hintText: 'your last name here',
                    keyboardType: TextInputType.text,
                    inputController: lastNameController,
                  ),
                  SizedBox(height: 3.h),
                  // Email Section
                  TextFieldWidget(
                    text: 'item description',
                    hintText: 'description',
                    keyboardType: TextInputType.text,
                    inputController: itemDescController,
                  ),
                  SizedBox(height: 3.h),
                  // Address
                  TextFieldWidget(
                    text: 'address',
                    hintText: 'your address',
                    keyboardType: TextInputType.text,
                    inputController: addressController,
                  ),
                  SizedBox(height: 3.h),
                  // City
                  TextFieldWidget(
                    text: 'city',
                    hintText: 'your current city',
                    keyboardType: TextInputType.text,
                    inputController: cityController,
                  ),
                  SizedBox(height: 3.h),
                  // State
                  TextFieldWidget(
                    text: 'state',
                    hintText: 'your state',
                    keyboardType: TextInputType.text,
                    inputController: stateController,
                  ),
                  SizedBox(height: 3.h),
                  // phone number
                  TextFieldWidget(
                    text: 'phone number',
                    hintText: 'your phone number',
                    keyboardType: TextInputType.phone,
                    isDoneTypeing: true,
                    inputController: phoneNumberController,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.5),
              ),
              child: ElevatedButton(
                onPressed: () {
                  showChoiceDialog(
                      title: 'Request for Bike',
                      message:
                          'You want to continue with your request for a bike?',
                      okOnPressed: () {
                        var fName = firstNameController.text.trim();
                        var lName = lastNameController.text.trim();
                        var itemDesc = itemDescController.text.trim();
                        var address = addressController.text.trim();
                        var city = cityController.text.trim();
                        var state = stateController.text.trim();
                        var phone = phoneNumberController.text.trim();

                        if (fName.isEmpty ||
                            lName.isEmpty ||
                            itemDesc.isEmpty ||
                            address.isEmpty ||
                            city.isEmpty ||
                            state.isEmpty ||
                            phone.isEmpty) {
                          authController.showSweetToast(
                            message:
                                "Wrong or empty fields. Kindly fill it properly and try again",
                            isSuccess: false,
                          );
                        } else {
                          // order bike function
                          deliveryController.orderBike(
                            firstName: fName,
                            lastName: lName,
                            itemDescription: itemDesc,
                            address: address,
                            city: city,
                            state: state,
                            phoneNum: phone,
                          );
                        }
                        // Get.back();
                        //Show bottom sheet
                        // showFoodyBottomSheet();
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
                  fixedSize: Size(MediaQuery.of(context).size.width, 7.h),
                  backgroundColor: FoodyColors.mainColor2,
                  foregroundColor: Colors.white,
                  elevation: 15,
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
