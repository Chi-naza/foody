import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/widgets/cart_item_widget.dart';
import 'package:get/get.dart';


class CartScreen extends StatefulWidget {

  static const String routeName = "/cart";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.58,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {                        
                    return CartItemWidget();
                  },
                  itemCount: 5,
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
                        'Items : 3', 
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        "\$ 87,28929",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: 14,
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.5),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    backgroundColor: FoodyColors.mainColor2,
                    foregroundColor: Colors.white,
                    elevation: 15,
                  ),
                  child: Text(
                    'Check Out',
                    style: TextStyle(
                      fontWeight: FontWeight.w800
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}