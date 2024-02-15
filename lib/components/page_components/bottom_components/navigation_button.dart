import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafe_customers_app/constants.dart';
import 'package:cafe_customers_app/utilities/of_screen_size.dart';

class PageNavigationButton extends StatelessWidget {
  const PageNavigationButton(
      {this.label, this.icon, this.isActive = false, super.key});

  final String? label;
  final IconData? icon;
  final bool isActive;

  static GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ofScreenHeight(context, 0.035),
        left: ofScreenWidth(context, 0.038),
        right: ofScreenWidth(context, 0.038),
      ), //symmetric(vertical: 30, horizontal: 15),
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: isActive ? kPrimaryColor : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 2))
              ],
            ),
            child: Icon(
              icon,
              color: isActive ? Colors.white : kPrimaryColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label!,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
          )
        ],
      ),
    );
  }
}
