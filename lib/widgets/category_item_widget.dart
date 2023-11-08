import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItemWidget extends StatelessWidget {
  final String itemName;
  final String itemImage;

  const CategoryItemWidget(
      {super.key, required this.itemName, required this.itemImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(11, 13, 11, 21),
      width: 100,
      height: 187,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
            padding: EdgeInsets.fromLTRB(3, 20, 2, 18),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x334bad73),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              // The Image
              child: SizedBox(
                width: 49,
                height: 30,
                child: Image.network(
                  itemImage, // 'assets/images/spinach...'
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Text
          Center(
            child: Text(
              itemName, // 'Fruits',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: FoodyColors.textFoodyblack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
