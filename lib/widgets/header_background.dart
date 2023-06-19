import 'package:flutter/material.dart';
import 'package:foody/constants/foody_images.dart';

class HeaderBackgroundWidget extends StatelessWidget {
  final Widget children;
  
  const HeaderBackgroundWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Curved Header
        Container(
          height: 450,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(FoodyImages.ellipseHeader),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          child: Column(
            children: [
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // text
                  Text(
                    "Foody",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(width: 10),
                  // carrot image
                  Image.asset(FoodyImages.carrot),
                ],
              ),
              SizedBox(height: 50),
              // Children widget here
              children,
              // Extra space at screen end
              SizedBox(height: 70),
            ],
          ),
        ),
      ],
    );
  }
}