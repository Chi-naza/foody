import 'package:flutter/material.dart';
import 'package:foody/widgets/food_item_card.dart';

class FoodyGridViewWidget extends StatelessWidget {
  const FoodyGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 17,
        childAspectRatio: 0.70385,
      ),
      padding: EdgeInsets.only(top: 40, bottom: 50, left: 15),
      itemBuilder: (_, index) => FoodItemCard(),
      itemCount: 5,
    );
  }

}