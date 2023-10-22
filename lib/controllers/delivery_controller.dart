import 'package:flutter/foundation.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/data/api/api_endpoints.dart';
import 'package:foody/data/api/helper_methods.dart';
import 'package:foody/models/bike_response_model.dart';
import 'package:foody/screens/main_pages/home_screen.dart';
import 'package:foody/widgets/progress_dialog.dart';
import 'package:get/get.dart';

class DeliveryController extends GetxController {
  final allBikeDeliveriesList = <BikeResponseModel>[];
  var authController = Get.find<AuthController>();
  @override
  void onReady() {
    fetchUsersPrevDeliveries();
    super.onReady();
  }

  // A function to order bike
  Future<void> orderBike({
    required String firstName,
    required String lastName,
    required String itemDescription,
    required String address,
    required String city,
    required String state,
    required String phoneNum,
  }) async {
    Get.back();

    showProgressDialog(message: 'Bike ordering in progress . . .');

    Response response = await HelperAPIMethods.postData(
      uri: FoodyAPI.BASE_URL + FoodyAPI.createBikeEndpoint,
      withHeader: true,
      body: {
        "first_name": firstName,
        "last_name": lastName,
        "item_description": itemDescription,
        "destination_address": address,
        "destination_city": city,
        "destination_state": state,
        "phone_number": phoneNum,
        "alternative_phone_number": phoneNum
      },
    );

    // final dResp = jsonDecode(response.body);

    if (kDebugMode) print("BIKE STATUS: ${response.statusCode}");
    if (kDebugMode) print("BIKE BODY: ${response.body}");

    if (response.statusCode == 200) {
      Get.back();

      debugPrint("BIKE DELIVERY ID: ${response.body["delivery_id"]}");
      authController.showSweetToast(message: "Bike ordered successfully");

      // Go to home screen
      Get.offAllNamed(HomeScreen.routeName);
    } else {
      Get.back();
      authController.showSweetToast(
        message: "Bike order failed. Please try again",
        isSuccess: false,
      );
    }
  }

  // get previous deliveries
  Future<void> fetchUsersPrevDeliveries() async {
    // Getting the Categories
    Response response = await HelperAPIMethods.getDataWithHeader(
        FoodyAPI.BASE_URL + FoodyAPI.deliveredProductsListEndpoint);

    if (kDebugMode) print('DELIVERIES RESPONSE: ${response.body}');

    if (response.statusCode == 200) {
      // A helper list variable
      List<BikeResponseModel> returnedList = [];

      // Looping through the response
      for (var d in response.body) {
        // Adding each data to our helper list
        returnedList.add(BikeResponseModel.fromJson(d));
      }

      // populating our ALL - CATEGORIES list
      allBikeDeliveriesList.assignAll(returnedList);
      if (kDebugMode) print('ALL DELIVERIES RESPONSE: $allBikeDeliveriesList');
    } else {
      if (kDebugMode) print("FAILED TO FETCH BIKE DELIVERIES . . .");
    }
  }
}
