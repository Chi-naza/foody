import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/constants/foody_images.dart';


class CartItemWidget extends StatefulWidget {

  const CartItemWidget({super.key,});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {


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
                image: AssetImage(FoodyImages.bakedMuffin),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
             ),
          ),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Carrot Crop', //cartItem.product.name,
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800)
                ),
                const Spacer(flex: 1),
                SizedBox(
                  width: 130,
                  height: 30,
                  child: Row(
                    children: [                     
                      Text(
                        "Quantity :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: FoodyColors.textFoodyblack,
                          fontSize: 15,
                        ),                        
                      ),
                      SizedBox(width: 7),
                      Text(
                        "2".padLeft(2, "0"),
                        style: TextStyle(
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
                onTap: () {print('Canceled');},
                child: Icon(
                  Icons.cancel,
                ),
              ),
              const Spacer(flex: 1),
              Text(
                "\$ 23,849",
                style: TextStyle(
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

