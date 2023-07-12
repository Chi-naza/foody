import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/controllers/product_controller.dart';
import 'package:get/get.dart';

class CustomAppBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController(), permanent: true);
    Get.put(ProductController());
    print('FROM BINDING:::::::::::::::::::\n');
    print('Binding Initialized');
  }

}