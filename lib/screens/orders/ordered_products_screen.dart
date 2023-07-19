import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/product_controller.dart';
import 'package:foody/data/api/api_endpoints.dart';
import 'package:foody/widgets/cart_item_widget.dart';
import 'package:get/get.dart';


class OrderedProductsScreen extends StatefulWidget {

  static const String routeName = "/orders";

  const OrderedProductsScreen({super.key});

  @override
  State<OrderedProductsScreen> createState() => _OrderedProductsScreenState();
}

class _OrderedProductsScreenState extends State<OrderedProductsScreen> {

  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(          
          child: Obx(() {
            // if cart is empty
              return productController.allOrdersList.isEmpty? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.5),
                  Text(
                    'You have not ordered any product yet !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: FoodyColors.textFoodyblack,
                      letterSpacing: 2,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ) : Column(
                children: [
                  SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [                                   
                      Text(
                        'My Orders',
                        style: TextStyle(
                          color: FoodyColors.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  // List of ORDER ITEMS here
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var orderedItem = productController.allOrdersList[index];
                        var date = orderedItem.createdAt.substring(0,10);
                        return InkWell(
                          onTap: () {},
                          child: CartItemWidget(
                            orderedProductsID: orderedItem.orderID,
                            isOrderedProducts: true,
                            productName: orderedItem.product.name.substring(0,1).toUpperCase() + orderedItem.product.name.substring(1),
                            productIndex: index, 
                            quantity: orderedItem.quantity, 
                            totalPrice: productController.formatToMoney(orderedItem.price.toString()), 
                            image: FoodyAPI.BASE_URL + orderedItem.product.image,   
                            orderedAt: date,                   
                          ),
                        );
                      },
                      itemCount: productController.allOrdersList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Divider(),
                        );
                      },
                    ),
                  ),   
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}