import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/controllers/product_controller.dart';
import 'package:foody/models/product_model.dart';
import 'package:foody/screens/cart_screen.dart';
import 'package:foody/widgets/related_product_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CategoryDetailScreen extends StatefulWidget {
  final ProductModel product;

  const CategoryDetailScreen({super.key, required this.product});

  static const String routeName = '/product-category-detail';

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  // for the two tabs
  int tabIndex = 0;

  // instance of controller
  final authController = Get.find<AuthController>();
  final productController = Get.find<ProductController>();

  // quantity desired
  int quantityDesired = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            // The Image
            Container(
              width: double.infinity,
              height: 341,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffc4c4c4),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.product.image),
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
                        ]),
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
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    // Categories Tag
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: FoodyColors.textFoodyGreen.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          widget.product.category.name
                                  .substring(0, 1)
                                  .toUpperCase() +
                              widget.product.category.name
                                  .substring(1), // 'vegetables',
                          style: GoogleFonts.inter(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: FoodyColors.textFoodyGreen,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    // Food Name Text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.product.name.substring(0, 1).toUpperCase() +
                            widget.product.name.substring(1), // 'Fresh Carrot',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          height: 0.75,
                          color: FoodyColors.textFoodyblack,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    // The Price and Kilogram
                    Row(
                      children: [
                        // price (discount)
                        Text(
                          '# ${productController.formatToMoney(widget.product.discountPrice.toString())}', // 'Rp 18,000',
                          style: GoogleFonts.inter(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: FoodyColors.textFoodyGreen,
                          ),
                        ),
                        // slash
                        Text(
                          '/Kg',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: FoodyColors.textFoodyGrey,
                          ),
                        ),
                        SizedBox(width: 5),
                        // Original Price Canceled
                        Text(
                          '# ${productController.formatToMoney(widget.product.realPrice.toString())}', // 'Rp 21,000',
                          style: GoogleFonts.inter(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: FoodyColors.textFoodyGrey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    // TABS
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            onTap: (index) {
                              setState(() {
                                tabIndex = index;
                              });
                            },
                            tabs: [
                              Container(
                                margin: EdgeInsets.fromLTRB(2, 0, 0, 8),
                                child: Text(
                                  'Description',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.2399999946,
                                    color: tabIndex == 0
                                        ? FoodyColors.textFoodyGreen
                                        : null,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(2, 0, 0, 8),
                                child: Text(
                                  'Nutritional facts',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.2399999946,
                                    color: tabIndex == 1
                                        ? FoodyColors.textFoodyGreen
                                        : null,
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
                            child: tabIndex == 0
                                ?
                                // View For Description
                                Container(
                                    child: Column(
                                      children: [
                                        // Description Text
                                        Text(
                                          widget.product
                                              .description, // 'The carrot is a root vegetable, most commonly observed as orange . . . .',
                                          style: GoogleFonts.inter(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2125,
                                            letterSpacing: 0.26,
                                            color: const Color(0xff828282),
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(height: 5.h),
                                        // Related-Product Text
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Related Products',
                                            style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              height: 1.2857142857,
                                              letterSpacing: 0.3000000119,
                                              color: FoodyColors.textFoodyblack,
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
                                            itemBuilder: (context, index) {
                                              return const RelatedProductCard();
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(width: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                :
                                // View For Nutritional Facts
                                Container(
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        'Details coming soon . . . !',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: FoodyColors.textFoodyGrey,
                                          letterSpacing: 2,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
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
        padding: EdgeInsets.fromLTRB(30, 22, 23, 21),
        // width:  375,
        height: 12.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x11000000),
              offset: Offset(0, -5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Remove Icon
            IconButton(
              onPressed: () {
                if (quantityDesired > 0) {
                  setState(() {
                    quantityDesired -= 1;
                  });
                }
              },
              icon: Icon(
                Icons.remove,
                color: FoodyColors.textFoodyGreen2,
                size: 20.sp,
              ),
            ),
            // Number of items added
            Container(
              // margin:  EdgeInsets.fromLTRB(0, 0, 10, 0),
              padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 5.sp),
              // width:  5.w,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0x260eb177),
                borderRadius: BorderRadius.circular(5.sp),
              ),
              child: Center(
                child: Center(
                  child: Text(
                    quantityDesired.toString(), // quantity selected/desired
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.2125,
                      color: FoodyColors.textFoodyGreen2,
                    ),
                  ),
                ),
              ),
            ),
            // Add Icon
            IconButton(
              onPressed: () {
                setState(() {
                  quantityDesired += 1;
                });
              },
              icon: Icon(
                Icons.add,
                color: FoodyColors.textFoodyGreen2,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 9.w),
            // Add To Cart Button wrapped with InkWell
            InkWell(
              onTap: () async {
                if (quantityDesired == 0) {
                  authController.showSweetToast(
                      message:
                          'Quantity is zero. Add at least one of this product',
                      isSuccess: false);
                } else {
                  // Computing total amount for a product based on the quantity desired
                  var total = quantityDesired *
                      double.parse(widget.product.discountPrice);
                  // Calling the method that will add product to cart
                  productController.addProductToCart(
                    product: widget.product,
                    quantity: quantityDesired,
                    totalPrice: total.toString(),
                  );
                  setState(() {
                    quantityDesired = 0;
                  });
                  Future.delayed(const Duration(seconds: 3));
                  Get.toNamed(CartScreen.routeName);
                }
              },
              child: Container(
                width: 40.w,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FoodyColors.textFoodyGreen2,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x11000000),
                      offset: Offset(0, 3),
                      blurRadius: 2.5,
                    ),
                  ],
                ),
                child: Center(
                  child: Center(
                    child: Text(
                      ' Add to Cart',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.2125,
                        color: Colors.white,
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
