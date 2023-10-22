import 'package:flutter/foundation.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/controllers/delivery_controller.dart';
import 'package:foody/controllers/product_controller.dart';
import 'package:get/get.dart';

class CustomAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(ProductController());
    Get.put(DeliveryController());
    if (kDebugMode) print('Binding Initialized');
  }
}
