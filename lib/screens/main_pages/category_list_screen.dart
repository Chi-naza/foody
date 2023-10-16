import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/product_controller.dart';
import 'package:foody/models/product_model.dart';
import 'package:foody/screens/cart_screen.dart';
import 'package:foody/widgets/category_item_widget.dart';
import 'package:foody/widgets/gridview_widget.dart';
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

  var availableCategories = <FullCategoryModel>[].obs;

  @override
  void initState() {
    runSearchFilter('');
    super.initState();
  }

  void runSearchFilter(String enteredKeyword) {
    List<FullCategoryModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = productController.allCategoryFullList;
    } else {
      results = productController.allCategoryFullList
          .where((cat) =>
              cat.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    // update our list
    availableCategories.value = results;

    setState(() {});
  }

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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                            color: Color(0xfff2f2f2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            cursorColor: FoodyColors.mainColor,
                            keyboardType: TextInputType.text,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.2125,
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search for fruits, vegetables . . .',
                              hintStyle: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.2125,
                                color: const Color(0xffbdbdbd),
                              ),
                              prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                ),
                                onPressed: () {
                                  return;
                                },
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              runSearchFilter(value);
                            },
                          ),
                        ),
                      ),
                      // Cart Icon
                      Obx(() {
                        return IconButton(
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: productController.cartProductsList.isEmpty
                                ? null
                                : Colors.red,
                          ),
                          onPressed: () {
                            Get.toNamed(CartScreen.routeName);
                          },
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              indicatorWeight: 3,
              tabs: availableCategories.isEmpty
                  ? [
                      Container(
                        child: Text(
                          'No item found',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.3000000119,
                            color: FoodyColors.textFoodyblack,
                          ),
                        ),
                      )
                    ]
                  : List.generate(availableCategories.length, (index) {
                      var item = availableCategories[index];
                      return Tab(
                        height: 130,
                        child: CategoryItemWidget(
                          itemName: item.name.substring(0, 1).toUpperCase() +
                              item.name.substring(1), //'Fruits',
                          itemImage: item.image, //FoodyImages.spinach,
                        ),
                      );
                    }),
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(availableCategories.length, (index) {
            var catItem = availableCategories[index];
            // var generatedList = productController.fetchProductsOfDifferentCategories(catItem.name);
            // var prodItem = generatedList[index];
            return FoodyGridViewWidget(categoryName: catItem.name);
          }),
        ),
      ),
    );
  }
}
