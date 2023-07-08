import 'package:flutter/material.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:get/get.dart';

class TestScreen extends GetView<AuthController> {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Testing APIs
            // await controller.loginUser("programmerchinaza@gmail.com", "string12345678");
            controller.showSweetToast(message: "Hello dear, I am doing this");
            // controller.showUserDetailsInLocals();
            print("REGISTRATION DONE !");
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
          child: const Text('Test API', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}