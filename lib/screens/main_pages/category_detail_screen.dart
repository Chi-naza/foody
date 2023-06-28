import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/widgets/related_product_card.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {

  int tabIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            // The Image
            Container(
              width:  double.infinity,
              height:  341,
              child: Container(
                decoration:  const BoxDecoration (
                  color:  Color(0xffc4c4c4),
                  image:  DecorationImage (
                    fit:  BoxFit.cover,
                    image:  AssetImage(FoodyImages.carrotDetailImage),
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black12,
                        Colors.black87,
                      ]
                    ),
                  ),
                ),
              ),
            ),
            // The Curved Container
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                // height: 500,
                width: double.infinity,   
                padding: EdgeInsets.symmetric(horizontal: 15),         
                decoration:  BoxDecoration (
                  color:  Colors.white,
                  borderRadius:  BorderRadius.only (
                    topLeft:  Radius.circular(30),
                    topRight:  Radius.circular(30),
                  ),                
                ),
                child: ListView(
                  children: [
                    // Vegetables Tag
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: FoodyColors.textFoodyGreen.withOpacity(0.1),
                          borderRadius:  BorderRadius.circular(30),
                        ),                     
                        child: Text(
                          'vegetables',
                          style:  GoogleFonts.inter(
                            fontSize:  15,
                            fontWeight:  FontWeight.w500,
                            color:  FoodyColors.textFoodyGreen,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Food Name Text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Fresh Carrot',
                        style:  GoogleFonts.inter(
                          fontSize:  24,
                          fontWeight:  FontWeight.w700,
                          height:  0.75,
                          color:  FoodyColors.textFoodyblack,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // The Price and Kilogram
                    Row(
                      children: [
                        // price
                        Text(
                          'Rp 18,000',
                          style:  GoogleFonts.inter(
                            fontSize:  18,
                            fontWeight:  FontWeight.w700,
                            color:  FoodyColors.textFoodyGreen,
                          ),
                        ),
                        // slash
                        Text(
                          '/Kg',
                          style: GoogleFonts.inter(
                            fontSize:  14,
                            fontWeight:  FontWeight.w400,
                            color: FoodyColors.textFoodyGrey,
                          ),
                        ),
                        SizedBox(width: 5),
                        // Original Price Canceled
                        Text(
                          'Rp 21,000',
                          style: GoogleFonts.inter(
                            fontSize:  12,
                            fontWeight:  FontWeight.w500,
                            color: FoodyColors.textFoodyGrey ,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    // TABS 
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            onTap: (index){
                              setState(() {
                                tabIndex = index;
                              });
                            },
                            tabs: [
                              Container(
                                margin:  EdgeInsets.fromLTRB(2, 0, 0, 8),
                                child: Text(
                                  'Description',
                                  textAlign:  TextAlign.center,
                                  style:  GoogleFonts.inter(
                                    fontSize:  14,
                                    fontWeight:  FontWeight.w400,
                                    letterSpacing:  -0.2399999946,
                                    color:  tabIndex==0? FoodyColors.textFoodyGreen : null,
                                  ),
                                ),
                              ),
                              Container(
                                margin:  EdgeInsets.fromLTRB(2, 0, 0, 8),
                                child: Text(
                                  'Nutritional facts',
                                  textAlign:  TextAlign.center,
                                  style:  GoogleFonts.inter(
                                    fontSize:  14,
                                    fontWeight:  FontWeight.w400,
                                    letterSpacing:  -0.2399999946,
                                    color:  tabIndex==1? FoodyColors.textFoodyGreen : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 13),
                          // Tab View
                          Container(
                            padding: EdgeInsets.only(bottom: 40),
                            // child is shown according to the tapped index
                            child: tabIndex==0? 
                            // View For Description
                            Container(
                              child: Column(
                                children: [
                                  // Description Text
                                  Text(
                                    'The carrot is a root vegetable, most commonly observed as orange in color, though purple, black, red, white, and yellow cultivars exist, all of which are domesticated forms of the wild carrot, Daucus carota, native to Europe and Southwestern Asia.',
                                    style:  GoogleFonts.inter(
                                      fontSize:  13,
                                      fontWeight:  FontWeight.w400,
                                      height:  1.2125,
                                      letterSpacing:  0.26,
                                      color:  const Color(0xff828282),
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(height: 20),
                                  // Related-Product Text
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Related Products',
                                      style:  GoogleFonts.inter(
                                        fontSize:  15,
                                        fontWeight:  FontWeight.w700,
                                        height:  1.2857142857,
                                        letterSpacing:  0.3000000119,
                                        color:  FoodyColors.textFoodyblack,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  // List of Related Products
                                  Container(
                                    height: 70,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      itemBuilder: (context, index){
                                        return const RelatedProductCard();
                                      }, 
                                      separatorBuilder: (context, index) => const SizedBox(width: 10),
                                    ),
                                  ),
                                ],
                              ),
                            ) 
                            :  
                            // View For Nutritional Facts
                            Icon(Icons.directions_transit, size: 350),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),          
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding:  EdgeInsets.fromLTRB(30, 22, 23, 21),
        width:  375,
        height:  92,
        decoration:  BoxDecoration (
          color:  Colors.white,
          borderRadius:  BorderRadius.only (
            topLeft:  Radius.circular(34),
            topRight:  Radius.circular(34),
          ),
          boxShadow:  [
            BoxShadow(
              color:  Color(0x11000000),
              offset:  Offset(0, -5),
              blurRadius:  10,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment:  CrossAxisAlignment.center,
          children:  [
            // Remove Icon
            IconButton(
              onPressed: () {
                print('Removing item');
              },
              icon: Icon(
                Icons.remove,
                color: FoodyColors.textFoodyGreen2,
                size: 28,
              ),
            ),
            // Number of items added
            Container(
              margin:  EdgeInsets.fromLTRB(0, 0, 10, 0),
              width:  49,
              height:  double.infinity,
              decoration:  BoxDecoration (
                color:  const Color(0x260eb177),
                borderRadius:  BorderRadius.circular(10),
              ),
              child: Center(
                child: Center(
                  child: Text(
                    '2',
                    textAlign:  TextAlign.center,
                    style:  GoogleFonts.inter(
                      fontSize:  18,
                      fontWeight:  FontWeight.w600,
                      height:  1.2125,
                      color: FoodyColors.textFoodyGreen2,
                    ),
                  ),
                ),
              ),
            ),
            // Add Icon
            IconButton(
              onPressed: () {
                print('Adding item');
              },
              icon: Icon(
                Icons.add,
                color: FoodyColors.textFoodyGreen2,
                size: 28,
              ),
            ),
            SizedBox(width: 10),
            // Add To Cart Button wrapped with InkWell
            InkWell(
              onTap: (){
                print('Adding to cart . . .');
              },
              child: Container(
                width:  181,
                height:  double.infinity,
                decoration:  BoxDecoration (
                  color:  FoodyColors.textFoodyGreen2,
                  borderRadius:  BorderRadius.circular(10),
                  boxShadow:  [
                    BoxShadow(
                      color:  Color(0x11000000),
                      offset:  Offset(0, 3),
                      blurRadius:  2.5,
                    ),
                  ],
                ),
                child: Center(
                  child: Center(
                    child: Text(
                      ' Add to Cart',
                      textAlign:  TextAlign.center,
                      style:  GoogleFonts.inter(
                        fontSize:  16,
                        fontWeight:  FontWeight.w600,
                        height:  1.2125,
                        color:  Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}