import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final double? boxWidth;
  final TextInputType? keyboardType;
  final TextEditingController? inputController;
  final bool isPassword;
  final bool isEmail;
  final bool isDoneTypeing;
  final Widget? suffixIcon;

  const TextFieldWidget(
      {super.key,
      required this.text,
      required this.hintText,
      this.boxWidth,
      this.keyboardType,
      this.inputController,
      this.isPassword = false,
      this.isEmail = false,
      this.isDoneTypeing = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // text
        Container(
          margin: EdgeInsets.only(left: 3),
          child: Text(
            text, // 'email'
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 1.2125,
              color: FoodyColors.textFoodyblack,
            ),
          ),
        ),
        SizedBox(height: 10),
        // Text field
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          width: boxWidth ?? 370,
          decoration: BoxDecoration(
            color: Color(0xfff2f2f2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: inputController,
            textInputAction:
                isDoneTypeing ? TextInputAction.done : TextInputAction.next,
            cursorColor: FoodyColors.mainColor,
            keyboardType: keyboardType ?? TextInputType.text,
            obscureText: isPassword,
            validator: ((text) {
              if (isEmail) {
                if (text!.isEmpty) {
                  return 'Email field is empty. Provide your email';
                } else if (!text.contains('@') || !text.contains('.')) {
                  return 'Invalid email address';
                } else {
                  return null;
                }
              }

              if (isPassword) {
                if (text!.isEmpty) {
                  return 'Password field is empty';
                } else if (text!.length < 8) {
                  return 'Password must be at least 8 characters';
                } else {
                  return null;
                }
              }

              if (!isPassword && !isEmail) {
                if (text!.isEmpty) {
                  return 'No value provided here';
                } else {
                  return null;
                }
              }
            }),
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.2125,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: hintText, // 'yourmail@mail.com',
              hintStyle: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.2125,
                color: const Color(0xffbdbdbd),
              ),
              border: InputBorder.none,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
