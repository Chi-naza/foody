import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/product_controller.dart';
import 'package:foody/data/api/api_endpoints.dart';
import 'package:foody/screens/cart_screen.dart';
import 'package:foody/widgets/category_item_widget.dart';
import 'package:foody/widgets/gridview_widget.dart';
import 'package:foody/widgets/option_dialog.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class CategoryListScreen extends StatefulWidget {
  
  const CategoryListScreen({super.key});

  static const String routeName = '/product-categories';

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {

  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: productController.allCategoryFullList.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(220),
          child: AppBar(    
            automaticallyImplyLeading: false,      
            title: SizedBox(
              child: // The Search Section
              Column(
                children: [
                  SizedBox(height: 60),
                  Row(
                    children: [
                      // Back Icon
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      // The Search Field
                      Expanded(
                        child: Container(
                          padding:  const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration:  BoxDecoration (
                            color:  Color(0xfff2f2f2),
                            borderRadius:  BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            cursorColor: FoodyColors.mainColor,
                            keyboardType: TextInputType.text,
                            style: GoogleFonts.inter(
                              fontSize:  14,
                              fontWeight:  FontWeight.w400,
                              height:  1.2125,
                              color:  Colors.black87,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search for fruits, vegetables . . .',
                              hintStyle: GoogleFonts.inter(
                                fontSize:  15,
                                fontWeight:  FontWeight.w400,
                                height:  1.2125,
                                color:  const Color(0xffbdbdbd),
                              ),
                              prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                ),
                                onPressed: (){
                                  print('Search Pressed');
                                },
                              ),
                              border: InputBorder.none,                        
                            ),
                          ),
                        ),
                      ),
                      // Cart Icon
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                        ),
                        onPressed: (){
                          Get.toNamed(CartScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
            bottom: TabBar(             
              isScrollable: true,
              indicatorWeight: 3,
              tabs: List.generate(productController.allCategoryFullList.length, (index) {
                var item = productController.allCategoryFullList[index];                
                return Tab(
                  height: 130,
                  child: CategoryItemWidget(
                    itemName: item.name.substring(0,1).toUpperCase() + item.name.substring(1),  //'Fruits',
                    itemImage: FoodyAPI.BASE_URL + item.image,  //FoodyImages.spinach,
                  ),
                );
              }),
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(productController.allCategoryFullList.length, (index) {
            var catItem = productController.allCategoryFullList[index];
            // var generatedList = productController.fetchProductsOfDifferentCategories(catItem.name);
            // var prodItem = generatedList[index];
            return FoodyGridViewWidget(categoryName: catItem.name);
          }),
        ),
      ),
    );
  }
}