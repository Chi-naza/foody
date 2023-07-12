import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/product_controller.dart';
import 'package:get/get.dart';

class CartItemWidget extends StatelessWidget {

  final String productName;
  final int quantity;
  final String totalPrice;
  final String image;
  final int productIndex;
  final bool isOrderedProducts;
  final String? orderedProductsID;
  final String? orderedAt;

  CartItemWidget({
    super.key, 
    required this.productName, 
    required this.quantity, 
    required this.totalPrice, 
    required this.image, 
    required this.productIndex, 
    this.isOrderedProducts=false, 
    this.orderedProductsID, 
    this.orderedAt
  });

  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
             ),
          ),
          const Spacer(flex: 1),
          SizedBox(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName, //cartItem.product.name,
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800)
                ),
                const Spacer(flex: 1),
                if(isOrderedProducts)
                  Container(
                    height: 20,
                    width: 200,
                    child: Text(
                      "ID: $orderedProductsID",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: FoodyColors.textFoodyblack,
                        fontSize: 13,
                      ),                        
                    ),
                  ),
                const Spacer(flex: 1),
                SizedBox(
                  width: 130,
                  height: 30,
                  child: Row(
                    children: [                     
                      const Text(
                        "Quantity :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: FoodyColors.textFoodyblack,
                          fontSize: 15,
                        ),                        
                      ),
                      SizedBox(width: 7),
                      Text(
                        "$quantity".padLeft(2, "0"),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: FoodyColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Spacer(flex: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  // remove cart item callback
                  productController.removeProductFromCart(productIndex);
                },  
                child: Icon(
                  isOrderedProducts? Icons.done_outline :Icons.cancel,
                  color: isOrderedProducts? Colors.green : null,
                ),
              ),
              const Spacer(flex: 1),
              if(isOrderedProducts)
                Container(
                    // height: 20,
                    // width: 200,
                    child: Text(
                      orderedAt??"",  //"Sat, 23rd 1999",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: FoodyColors.textFoodyblack,
                        fontSize: 12,
                      ),                        
                    ),
                  ),
              const Spacer(flex: 1),
              Text(
                "# $totalPrice",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

