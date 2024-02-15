import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafe_customers_app/constants.dart';
import 'package:cafe_customers_app/utilities/of_screen_size.dart';
import 'package:cafe_customers_app/utilities/sample_data.dart';

class PageCreditCard extends StatelessWidget {
  const PageCreditCard({required this.name, required this.balance, super.key});

  final String name;
  final int balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ofScreenHeight(context, 0.215),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: kSecondaryColor),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Loyalty Badge',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'VIP',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Balance',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$balance Cups',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          name,
                          style: GoogleFonts.poppins(
                              height: 1.75,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: ofScreenWidth(context, 0.28),
                      child: Image.asset('assets/images/logo_text.png'),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              left: ofScreenWidth(context, -0.188),
              child: Image.asset('assets/images/logo.png', fit: BoxFit.contain))
        ],
      ),
    );
  }
}
