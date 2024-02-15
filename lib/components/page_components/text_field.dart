import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafe_customers_app/constants.dart';

class PageTextField extends StatelessWidget {
  const PageTextField(
      {this.hintText, this.controller, this.keyboardType, super.key});

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  static InputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: kLightGrey, width: 1),
    borderRadius: BorderRadius.circular(5),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: kLightGrey,
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.only(left: 17, top: 5),
          enabledBorder: border,
          border: border,
        ),
      ),
    );
  }
}
