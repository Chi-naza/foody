import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/widgets/category_item_widget.dart';
import 'package:foody/widgets/gridview_widget.dart';
import 'package:google_fonts/google_fonts.dart';



class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(220),
          child: AppBar(          
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
                        onPressed: (){
                          print('Pressed Back Button');
                        },
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
                          print('Pressed Cart Icon');
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
              tabs: [
                Tab(
                  child: CategoryItemWidget(
                    itemName: 'Fruits',
                    itemImage: FoodyImages.spinach,
                  ),
                  height: 130,
                ),
                Tab(
                  child: CategoryItemWidget(
                    itemName: 'Baked Muffin',
                    itemImage: FoodyImages.bakedMuffin,
                  ),
                  height: 130,
                ),
                Tab(
                  child: CategoryItemWidget(
                    itemName: 'Juicy',
                    itemImage: FoodyImages.juicyFruit,
                  ),
                  height: 130,
                ),
                Tab(
                  child: CategoryItemWidget(
                    itemName: 'Milk Box',
                    itemImage: FoodyImages.milkBox,
                  ),
                  height: 130,
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            FoodyGridViewWidget(),
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    );
  }
}