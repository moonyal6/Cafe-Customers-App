// ignore_for_file: sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafe_customers_app/components/page_components/user_greet.dart';
import 'package:cafe_customers_app/components/page_components/verified_icon.dart';
import 'package:cafe_customers_app/constants.dart';
import 'package:cafe_customers_app/providers/user_provider.dart';
import 'package:cafe_customers_app/screens/profile_screen.dart';
import 'package:cafe_customers_app/utilities/of_screen_size.dart';
import 'package:provider/provider.dart';
import '../components/page_components/bottom_components/bottom_section.dart';
import '../components/page_components/bottom_components/button.dart';
import '../components/page.dart';
import '../components/page_components/bottom_components/navigation_button.dart';
import '../utilities/animate_router.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  static String route = '/reward';

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  bool isVisible = false;
  void Function()? buttonHandler = () {};

  List<Widget> navigationButtons = [
    const PageNavigationButton(
      icon: Icons.account_circle,
      label: 'Profile',
    ), //.animate().fadeOut(duration: const Duration(milliseconds: 500)),
    const PageNavigationButton(
      icon: Icons.qr_code_scanner,
      label: 'Scan',
    ), //.animate().fadeOut(duration: const Duration(milliseconds: 500)),
    const PageNavigationButton(
      icon: Icons.star,
      label: 'Reward',
      isActive: true,
    )
        .animate()
        .moveX(begin: 64 + 15, duration: const Duration(milliseconds: 500)),
  ];

  @override
  void initState() {
    super.initState();
    asyncCallback();
  }

  void asyncCallback() async {
    Iterable<Widget> hiddenNavButtons = navigationButtons.getRange(0, 2);
    setState(() {
      // navigationButtons.last
      //     .animate()
      //     .moveX(
      //       end: 164 ,
      //       duration: const Duration(milliseconds: 500));
      navigationButtons.removeRange(0, 2);
    });

    Timer(const Duration(seconds: 3), () {
      // <-- Delay here
      setState(() {
        isVisible = true;
        buttonHandler = () {
          FadeInRoute.push(context, ProfileScreen.route, const ProfileScreen());
        };

        navigationButtons = [
          const PageNavigationButton(
            icon: Icons.star,
            label: 'Reward',
            isActive: true,
          ).animate().moveX(
              delay: 1.milliseconds,
              begin: -64 - ofScreenWidth(context, 0.076),
              duration: const Duration(milliseconds: 500)),
        ];
        navigationButtons.insertAll(0, [
          const PageNavigationButton(
            icon: Icons.account_circle,
            label: 'Profile',
          ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
          const PageNavigationButton(
            icon: Icons.qr_code_scanner,
            label: 'Scan',
          ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
        ]);
      });
    });
  }

  Widget opacityWidget({required child}) => AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: Duration(milliseconds: 500),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return AppPage(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ofScreenWidth(context, kSidePaddingPercent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Greeting
                opacityWidget(
                  child: PageUserGreet(
                    greeting: 'Good Morning!',
                    name: Provider.of<UserProvider>(context).name!,
                  ),
                ),

                SizedBox(height: ofScreenHeight(context, 0.04)),

                // Title
                Text(
                  'Cup Count Success!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                // Success Image
                PageVerifiedIcon(
                  size: ofScreenWidth(context, 0.29),
                ),
                // SizedBox.square(
                //   dimension: ofScreenWidth(context, 0.29),
                //   child: Image.asset('assets/images/Success.png'),
                // ),

                SizedBox(height: ofScreenHeight(context, 0.085)),

                // Lorem Text
                Text(
                  'Lorem ipsum is simply dummy text of the printing and typesetting.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
              ],
            )
          ],
        ),
      ),

      // Bottom Section
      bottomSection: PageBottomSection(
          // Button
          button: opacityWidget(
            child: PageButton(
              onPressed: buttonHandler,
              text: 'Okay',
            ),
          ),

          // Navigation Buttons
          navigationButtons: navigationButtons),
    );
  }
}
