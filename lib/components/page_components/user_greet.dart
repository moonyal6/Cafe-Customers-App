import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class PageUserGreet extends StatelessWidget {
  const PageUserGreet({required this.greeting, required this.name ,super.key});

  final String greeting;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Greeting
        Text(
          greeting,
          textAlign: TextAlign.left,
          style: GoogleFonts.inter(
              fontSize: 15, color: Colors.black.withOpacity(0.6)),
        ),

        // User Name
        Text(
          name,
          textAlign: TextAlign.left,
          style: GoogleFonts.inter(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
