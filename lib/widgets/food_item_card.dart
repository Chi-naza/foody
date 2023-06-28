import 'package:flutter/material.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItemCard extends StatefulWidget {

  const FoodItemCard({super.key});

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
                image:  AssetImage(FoodyImages.carrotPic), // food image
              ),
              borderRadius:  BorderRadius.only (
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
                  print('My Favorite');
                },
                child: SizedBox(
                  width:  31.28,
                  height:  30.7,
                  child: Container(
                    margin:  EdgeInsets.fromLTRB(0, 0, 0, 90.3),
                    child: Icon(
                        Icons.favorite,
                        color: isFavorite? Colors.green : Colors.white,
                    ),
                  ),
              ),
              ),
            ),
          ),
          Container(
            margin:  EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Text(
              'Fresh Carrot',
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
                          'Rp 18,000',
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
                              'Rp 21,000',
                              style:  GoogleFonts.inter(
                                fontSize:  11,
                                fontWeight:  FontWeight.w500,
                                height:  1.9090909091,
                                letterSpacing:  -0.3199999928,
                                color:  Color(0xffbdbdbd),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    print('Added to cart !');
                  },
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