import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/widgets/category_item_widget.dart';
import 'package:foody/widgets/header_background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // For the Bottom Nav Bar
  var _currentIndex = 0;

  static const _images = [
    FoodyImages.carouselImage,
    FoodyImages.carouselImage,
    FoodyImages.carouselImage,
    FoodyImages.carouselImage,
  ];

  @override
  void initState() {
    super.initState();
    precache();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HeaderBackgroundWidget(
            heightFromTop: 20,
            heightBtwTextnChildren: 0,
            foodyTextFontSize: 30,
            children: Column(
              children: [
                SizedBox(height: 30),              
                // The Search Section
                Row(
                  children: [
                    SizedBox(width: 10),
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
                            hintText: 'Search for fruits, vegetables, groceries . . .',
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
                    // Back Icon
                    IconButton(
                      icon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: (){
                        print('Pressed message Button');
                      },
                    ),
                    // Cart Icon
                    IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: (){
                        print('Pressed Notification Icon');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 40),
                // LOCATION text
                Row(
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          IconButton(
                            onPressed: (){}, 
                            icon:Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            )
                          ),
                          Text(
                            'Sent to',
                            style:  GoogleFonts.inter(
                              fontSize:  12,
                              fontWeight:  FontWeight.w400,
                              letterSpacing:  0.3000000119,
                              color:  Color(0xffffffff),
                            ),
                          ),
                       ],
                      ),
                    ),
                    // location
                    Text(
                      'Pamulang Barat Residence No.5, RT 05/ ...',
                      style:  GoogleFonts.inter(
                        fontSize:  12,
                        fontWeight:  FontWeight.w600,
                        color:  Color(0xffffffff),
                      ),
                    ),
                    // arrow down icon
                    IconButton(
                      onPressed: (){}, 
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Carousel HERE   
                Container(
                  height: 230,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 210,
                          child: ScrollPageView(
                            controller: ScrollPageController(),
                            children: _images.map((image) => _imageView(image)).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Categories TEXT
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left:10),
                    child: Text(
                      'Categories',
                      style:  GoogleFonts.inter(
                        fontSize:  19,
                        fontWeight:  FontWeight.w700,
                        letterSpacing:  0.3000000119,
                        color:  FoodyColors.textFoodyblack,
                      ),
                    ),
                  ),
                ),                
                // List of Categories
                Container(
                  height: 150,
                  // color: Colors.red[100],
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryItemWidget(
                        itemName: 'Fruits',
                        itemImage: FoodyImages.spinach,
                      ),
                      CategoryItemWidget(
                        itemName: 'Baked Muffin',
                        itemImage: FoodyImages.bakedMuffin,
                      ),
                      CategoryItemWidget(
                        itemName: 'Juicy',
                        itemImage: FoodyImages.juicyFruit,
                      ),
                      CategoryItemWidget(
                        itemName: 'Milk Box',
                        itemImage: FoodyImages.milkBox,
                      ),
                      CategoryItemWidget(
                        itemName: 'Fruits',
                        itemImage: FoodyImages.spinach,
                      ),
                      CategoryItemWidget(
                        itemName: 'Baked Muffin',
                        itemImage: FoodyImages.bakedMuffin,
                      ),
                      CategoryItemWidget(
                        itemName: 'Juicy',
                        itemImage: FoodyImages.juicyFruit,
                      ),
                      CategoryItemWidget(
                        itemName: 'Milk Box',
                        itemImage: FoodyImages.milkBox,
                      ),
                    ],
                  ),
                ),
                // Divider HERE
                const Divider(), 
                SizedBox(height: 20),
                // Special Dial & See More Section
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text Special Deal
                      Text(
                        'Special Deal',
                        style:  GoogleFonts.inter(
                          fontSize:  19,
                          fontWeight:  FontWeight.w700,
                          color:  FoodyColors.textFoodyblack,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          print('Lets Go and See More . . .');
                        },
                        child: Row(
                          children: [
                            // Text 'See More'
                            Text(
                              'See more',
                              textAlign:  TextAlign.center,
                              style:  GoogleFonts.inter(
                                fontSize:  13,
                                fontWeight:  FontWeight.w500,
                                letterSpacing:  -0.0780000016,
                                color:  FoodyColors.textFoodyGreen,
                              ),
                            ),
                            // Arrow Icon
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 13,
                              color: FoodyColors.textFoodyGreen,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                // Space at screen end
                Container(
                  height: 170,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return Container(
                        width:  145,
                        height:  130,
                        child: Container(
                          decoration:  BoxDecoration (
                            borderRadius:  BorderRadius.circular(10),
                            color:  Color(0xffc4c4c4),
                            image:  DecorationImage (
                              fit:  BoxFit.cover,
                              image:  AssetImage (FoodyImages.speedDialImage),
                            ),
                          ),
                        ), 
                      );  
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 15),
                  ),
                ),    
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.green,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              title: Text("My Cart"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person_outlined),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
    );
  }

  /// Structuring the image view
  Widget _imageView(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }

  ///[IndicatorWidgetBuilder]
  Widget? _indicatorBuilder(BuildContext context, int index, int length) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: const BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: RichText(
        text: TextSpan(
          text: '${index + 1}',
          style: const TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
          children: [
            const TextSpan(
              text: '/',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            TextSpan(
              text: '$length',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }


  /// Preloaing the image
  Future<void> precache() async {
    for (var image in _images) {
      precacheImage(AssetImage(image), context);
    }
  }


}