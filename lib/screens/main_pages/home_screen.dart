import 'package:flutter/material.dart';
import 'package:foody/screens/auth/profile_screen.dart';
import 'package:foody/screens/cart_screen.dart';
import 'package:foody/screens/main_pages/home_screen_body.dart';
import 'package:foody/screens/order_bike_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // For the Bottom Nav Bar
  var _currentIndex = 0;

  final foodyMainScreens = [
    const HomeScreenBody(),
    const OrderBikeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: foodyMainScreens[_currentIndex],
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
            icon: Icon(Icons.motorcycle_rounded),
            title: Text("Bike"),
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
}
