import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:google_fonts/google_fonts.dart';

class RelatedProductCard extends StatelessWidget {
  const RelatedProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.fromLTRB(0, 0, 19, 0),
      width:  215,
      height: 70,
      decoration:  BoxDecoration (
        color:  Color(0xffffffff),
        borderRadius:  BorderRadius.circular(10),
        boxShadow:  [
          BoxShadow(
            color:  Color(0x11000000),
            offset:  Offset(0, 3),
            blurRadius:  2.5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children: [
          Container(
            margin:  EdgeInsets.fromLTRB(0, 0, 9, 0),
            width:  84,
            height:  70,
            decoration:  BoxDecoration (
              color:  Color(0xffc4c4c4),
              borderRadius:  BorderRadius.only (
                topLeft:  Radius.circular(10),
                bottomLeft:  Radius.circular(10),
              ),
              image:  const DecorationImage (
                fit:  BoxFit.cover,
                image:  AssetImage (
                  FoodyImages.carrotDetailImage, // the image
                ),
              ),
            ),
          ),
          Container(
            margin:  EdgeInsets.fromLTRB(0, 11, 0, 12),
            width:  100,
            height:  double.infinity,
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children:  [
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 0, 3),
                  child: Text(
                    'Fresh Red Chili',
                    style:  GoogleFonts.inter (
                      fontSize:  13,
                      fontWeight:  FontWeight.w600,
                      height:  1.2125,
                      color:  const Color(0xff333333),
                    ),
                  ),
                ),
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 25, 0),
                  width:  double.infinity,
                  child: Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        margin:  EdgeInsets.fromLTRB(0, 0, 2, 0),
                        child: Text(
                          'Rp 12,000',
                          style:  GoogleFonts.inter(
                            fontSize:  11,
                            fontWeight:  FontWeight.w700,
                            height:  1.9090909091,
                            letterSpacing:  -0.3199999928,
                            color:  FoodyColors.textFoodyGreen,
                          ),
                        ),
                      ),
                      Text(
                        '/ kg',
                        style:  GoogleFonts.inter(
                          fontSize:  8,
                          fontWeight:  FontWeight.w400,
                          height:  1.625,
                          letterSpacing:  0.0659999996,
                          color:  FoodyColors.textFoodyGrey,
                        ),
                      ),
                    ],
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