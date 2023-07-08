import 'package:flutter/material.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/widgets/header_background.dart';
import 'package:foody/widgets/category_item_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {

  static const _images = [
    FoodyImages.carouselImage,
    FoodyImages.carouselImage,
    FoodyImages.carouselImage,
    FoodyImages.carouselImage,
  ];

  static const _speedDialImages = [
    FoodyImages.carrotDetailImage,
    FoodyImages.speedDial1,
    FoodyImages.speedDial2,
  ];

  @override
  void initState() {
    super.initState();
    // Solving the error of: dependOnInheritedElement()
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      precache();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  itemCount: 3,
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
                            image:  AssetImage (_speedDialImages[index]),
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