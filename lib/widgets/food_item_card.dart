import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItemCard extends StatefulWidget {
  final String price;
  final String discountPrice;
  final String productName;
  final String image;
  final VoidCallback addToCartFunc;

  const FoodItemCard({super.key, required this.price, required this.discountPrice, required this.productName, required this.image, required this.addToCartFunc});

  @override
  State<FoodItemCard> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.fromLTRB(0, 0, 21, 0),
      width:  157,
      height: 260,
      decoration:  BoxDecoration (
        color:  Color(0xffffffff),
        borderRadius:  BorderRadius.circular(10),
        boxShadow:  [
          BoxShadow(
            color:  Color(0x14000000),
            offset:  Offset(0, 3),
            blurRadius:  4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children:  [
          // Image in the Card
          Container(
            margin:  EdgeInsets.fromLTRB(0, 0, 0, 7),
            padding:  EdgeInsets.fromLTRB(120, 5, 5.72, 5),
            width:  double.infinity,
            height:  131,
            decoration:  BoxDecoration (
              color:  Color(0xffc4c4c4),
              image:  DecorationImage (
                fit:  BoxFit.cover,
                image:  NetworkImage(widget.image), // food image
              ),
              borderRadius:  const BorderRadius.only (
                topLeft:  Radius.circular(10),
                topRight:  Radius.circular(10),
              ),
            ),
            child: Align(
              alignment:  Alignment.topRight,
              child: InkWell(
                onTap: (){
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  if(kDebugMode)print('My Favorite');
                },
                child: SizedBox(
                  width:  31.28,
                  height:  30.7,
                  child: Container(
                    margin:  EdgeInsets.fromLTRB(0, 0, 0, 90.3),
                    child: Icon(
                        Icons.favorite,
                        color: isFavorite? Colors.red : Colors.white,
                    ),
                  ),
              ),
              ),
            ),
          ),
          Container(
            margin:  EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Text(
              widget.productName,  //'Fresh Carrot',
              style:  GoogleFonts.inter (
                fontSize:  14,
                fontWeight:  FontWeight.w600,
                height:  2.1428571429,
                color:  Color(0xff333333),
              ),
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(12, 0, 10, 10),
            width:  double.infinity,
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 53, 1),
                  width:  double.infinity,
                  child: Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        margin:  EdgeInsets.fromLTRB(0, 0, 2, 0),
                        child: Text(
                          '# ${widget.discountPrice}',  // '# 18,000
                          style:  GoogleFonts.inter(
                            fontSize:  13,
                            fontWeight:  FontWeight.w700,
                            height:  1.6153846154,
                            letterSpacing:  -0.3199999928,
                            color:  Color(0xff4bad73),
                          ),
                        ),
                      ),
                      Text(
                        '/ kg',
                        style:  GoogleFonts.inter(
                          fontSize:  10,
                          fontWeight:  FontWeight.w400,
                          height:  1.3,
                          letterSpacing:  0.0659999996,
                          color:  Color(0xff828282),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 83, 2),
                  width:  52,
                  height:  21,
                  child: Stack(
                    children:  [
                      Positioned(
                        left:  1,
                        top:  0,
                        child: Align(
                          child: SizedBox(
                            width:  50,
                            height:  21,
                            child: Text(
                              '# ${widget.price}',
                              style:  GoogleFonts.inter(
                                fontSize:  11,
                                fontWeight:  FontWeight.w500,
                                height:  1.9090909091,
                                letterSpacing:  -0.3199999928,
                                decoration: TextDecoration.lineThrough,
                                color:  const Color(0xffbdbdbd),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: widget.addToCartFunc,
                  child: Container(
                    margin:  EdgeInsets.fromLTRB(107, 0, 0, 0),
                    width:  28,
                    height:  28,
                    child: Image.asset(
                      FoodyImages.plusIcon, // plus Icon
                      width:  28,
                      height:  28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}