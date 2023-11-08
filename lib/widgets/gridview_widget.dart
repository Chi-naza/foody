import 'package:flutter/material.dart';
import 'package:foody/controllers/product_controller.dart';

import 'package:foody/screens/main_pages/category_detail_screen.dart';
import 'package:foody/widgets/food_item_card.dart';
import 'package:foody/widgets/option_dialog.dart';
import 'package:get/get.dart';

class FoodyGridViewWidget extends StatelessWidget {
  final String categoryName;

  FoodyGridViewWidget({super.key, required this.categoryName});

  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    final generatedList =
        productController.fetchProductsOfDifferentCategories(categoryName);

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          childAspectRatio: 0.670385,
        ),
        padding: EdgeInsets.only(top: 40, bottom: 60, left: 15),
        itemCount: generatedList.length,
        itemBuilder: (_, index) {
          var prodItem = generatedList[index];
          return GestureDetector(
            onTap: () {
              Get.to(CategoryDetailScreen(product: prodItem));
            },
            child: FoodItemCard(
              price: productController
                  .formatToMoney(prodItem.realPrice.toString()),
              discountPrice: productController
                  .formatToMoney(prodItem.discountPrice.toString()),
              productName: prodItem.name,
              image: prodItem.image,
              addToCartFunc: () {
                showChoiceDialog(
                    title: "Add to Cart",
                    message:
                        "You're sure you want to add this product to cart?",
                    okOnPressed: () {
                      // Calling add to cart function from product controller
                      productController.addProductToCart(
                          product: prodItem,
                          quantity: 1,
                          totalPrice: prodItem.discountPrice.toString());
                      // Push off the dialog
                      Get.back();
                    });
              },
            ),
          );
        });
  }
}
