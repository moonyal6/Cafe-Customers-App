// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafe_customers_app/components/page_components/bottom_components/bottom_section.dart';
import 'package:cafe_customers_app/components/page_components/bottom_components/button.dart';
import 'package:cafe_customers_app/components/page.dart';
import 'package:cafe_customers_app/components/page_components/user_greet.dart';
import 'package:cafe_customers_app/constants.dart';
import 'package:cafe_customers_app/providers/user_provider.dart';
import 'package:cafe_customers_app/screens/reward_screen.dart';
import 'package:cafe_customers_app/utilities/animate_router.dart';
import 'package:cafe_customers_app/utilities/of_screen_size.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../components/page_components/bottom_components/navigation_button.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  static String route = '/scan';

  @override
  Widget build(BuildContext context) {
    void handlePress() {
      FadeInRoute.push(context, RewardScreen.route, const RewardScreen());
    }

    return AppPage(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ofScreenWidth(context, kSidePaddingPercent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Greeting
            PageUserGreet(
              greeting: 'Good Morning!',
              name: Provider.of<UserProvider>(context).name!,
            ),

            SizedBox(height: ofScreenHeight(context, 0.03)),

            // Lorem Text
            Hero(
              tag: kLoremTag,
              child: Material(
                color: Colors.transparent,
                child: Text(
                  kLorem,
                  style: GoogleFonts.inter(color: kDarkGrey),
                ),
              ),
            ),

            SizedBox(height: ofScreenHeight(context, 0.05)),

            // QR Code
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Provider.of<UserProvider>(context).checkUser()
                      ? QrImageView(
                          padding: const EdgeInsets.all(18),
                          data:
                              Provider.of<UserProvider>(context).getUserJson(),
                          gapless: false,
                          eyeStyle: const QrEyeStyle(
                              color: kSecondaryColor,
                              eyeShape: QrEyeShape.square),
                          dataModuleStyle: const QrDataModuleStyle(
                              color: kPrimaryColor,
                              dataModuleShape: QrDataModuleShape.circle),
                          // size: constraints.maxWidth - 18,
                        )
                      : Icon(
                          Icons.qr_code_scanner_rounded,
                          color: kPrimaryColor,
                          size: constraints.maxWidth,
                        );
                }),
              ),
            ),
          ],
        ),
      ),

      // Bottom Section
      bottomSection: PageBottomSection(
        // Button
        button: PageButton(
          text: 'Next',
          onPressed: handlePress,
        ),

        // Navigation Buttons
        navigationButtons: const [
          PageNavigationButton(
            icon: Icons.account_circle,
            label: 'Profile',
          ),
          PageNavigationButton(
            icon: Icons.qr_code_scanner,
            label: 'Scan',
            isActive: true,
          ),
          PageNavigationButton(
            icon: Icons.star,
            label: 'Reward',
          ),
        ],
      ),
    );
  }
}
