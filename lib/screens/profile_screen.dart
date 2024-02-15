import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafe_customers_app/components/page.dart';
import 'package:cafe_customers_app/components/page_components/bottom_components/bottom_section.dart';
import 'package:cafe_customers_app/components/page_components/bottom_components/button.dart';
import 'package:cafe_customers_app/components/page_components/credit_card.dart';
import 'package:cafe_customers_app/components/page_components/cup_chart.dart';
import 'package:cafe_customers_app/components/page_components/user_greet.dart';
import 'package:cafe_customers_app/providers/user_provider.dart';
import 'package:cafe_customers_app/screens/scan_screen.dart';
import 'package:cafe_customers_app/utilities/animate_router.dart';
import 'package:provider/provider.dart';

import '../components/page_components/bottom_components/navigation_button.dart';
import '../constants.dart';
import '../utilities/of_screen_size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static String route = '/profile';

  @override
  Widget build(BuildContext context) {
    return AppPage(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ofScreenWidth(context, kSidePaddingPercent)),
            child: Column(
              children: [
                // Greeting
                PageUserGreet(
                  greeting: 'Dear',
                  name: Provider.of<UserProvider>(context).name!,
                ),

                SizedBox(height: ofScreenHeight(context, 0.03)),

                // Lorem Text
                Text(
                  kLorem,
                  style: GoogleFonts.inter(fontSize: 14, color: kDarkGrey),
                ),
              ],
            ),
          ),

          SizedBox(height: ofScreenHeight(context, 0.023)),

          // Credit Card
          PageCreditCard(
            name: Provider.of<UserProvider>(context).name!,
            balance: Provider.of<UserProvider>(context).balance!,
          ),

          // Counters
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ofScreenWidth(context, kSidePaddingPercent),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Chart
                  // const PageCupChart(
                  //   diameter: 65,
                  //   circumference: 20.0 * pi,
                  // ),
                  SizedBox.square(
                    dimension: ofScreenWidth(context, 0.43),
                    child: Image.asset('assets/images/Chart.png'),
                  ),

                  // Free Drinks
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 3,
                              bottom: 3,
                              right: 5,
                            ),
                            child: Icon(
                              Icons.local_drink_outlined,
                              size: 30,
                              color: kPrimaryColor,
                            ),
                          ),
                          Text(
                            Provider.of<UserProvider>(context)
                                .freeDrinks!
                                .toString(),
                            style: GoogleFonts.inter(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Free Drinks',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kDark),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomSection: PageBottomSection(
        button: PageButton(
          text: 'Generate QR',
          onPressed: (() {
            Navigator.pop(context);
            FadeInRoute.push(context, ScanScreen.route, const ScanScreen());
          }),
        ),
        navigationButtons: const [
          PageNavigationButton(
            icon: Icons.star,
            label: 'Reward',
            isActive: true,
          ),
        ],
      ),
    );
  }
}
