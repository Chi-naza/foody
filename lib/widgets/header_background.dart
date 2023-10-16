import 'package:flutter/material.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:sizer/sizer.dart';

class HeaderBackgroundWidget extends StatelessWidget {
  final Widget children;
  final double? heightFromTop;
  final double? heightBtwTextnChildren;
  final double? foodyTextFontSize;
  final double? containerSize;

  const HeaderBackgroundWidget({
    super.key,
    required this.children,
    this.heightFromTop,
    this.heightBtwTextnChildren,
    this.foodyTextFontSize,
    this.containerSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Curved Header
        Container(
          height: containerSize ?? 57.h,
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
              SizedBox(height: heightFromTop ?? 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // text
                  Text(
                    "Onics Store",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: foodyTextFontSize ?? 31.sp,
                        color: Colors.white),
                  ),
                  SizedBox(width: 7.w),
                  // carrot image
                  Image.asset(FoodyImages.carrot),
                ],
              ),
              SizedBox(height: heightBtwTextnChildren ?? 8.h),
              // Children widget here
              children,
              // Extra space at screen end
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ],
    );
  }
}
