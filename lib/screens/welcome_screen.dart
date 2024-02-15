// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafe_customers_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../components/page_components/bottom_components/button.dart';
import '../components/page_components/bottom_components/navigation_button.dart';
import '../components/page_components/bottom_components/bottom_section.dart';
import '../components/page.dart';
import '../components/page_components/text_field.dart';
import '../constants.dart';
import '../screens/scan_screen.dart';
import '../utilities/animate_router.dart';
import '../utilities/of_screen_size.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  static String route = '/welcome';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handelSubmit() {
      // if (nameController.text == '' ||
      //     emailController.text == '' ||
      //     mobileController.text == '') return;

      Provider.of<UserProvider>(context, listen: false).setUser(
        newName: nameController.text,
        newEmail: emailController.text,
        newMobile: int.parse(mobileController.text),
      );

      FadeInRoute.push(context, ScanScreen.route, const ScanScreen());
    }

    return AppPage(
      showAppBar: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: ofScreenHeight(context, 0.44),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Welcome Text
                Text(
                  'Welcome!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                      fontSize: 40),
                ),

                // Lorem Text
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ofScreenWidth(context, kSidePaddingPercent),
                  ),
                  child: Hero(
                    tag: kLoremTag,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        kLorem,
                        style: GoogleFonts.inter(color: kDarkGrey),
                      ),
                    ),
                  ),
                ),

                const SizedBox(),

                // Text Fields
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PageTextField(
                      hintText: 'Full Name',
                      controller: nameController,
                      keyboardType: TextInputType.name,
                    ),
                    PageTextField(
                      hintText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    PageTextField(
                      hintText: 'Mobile',
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Button Label
          Text(
            'One more step to go!',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w800,
              color: kDarkGrey,
              fontSize: 14,
            ),
          ),
        ],
      ),

      // Bottom Section
      bottomSection: PageBottomSection(
        buttonLabel: 'One more step to go!',
        button: PageButton(
          text: 'Generate QR',
          onPressed: handelSubmit,
        ),
        navigationButtons: const [
          PageNavigationButton(
            icon: Icons.account_circle_rounded,
            label: 'Profile',
            isActive: true,
          ),
          PageNavigationButton(
            icon: Icons.qr_code_scanner_rounded,
            label: 'Scan',
          ),
          PageNavigationButton(
            icon: Icons.star_rounded,
            label: 'Reward',
          ),
        ],
      ),
    );
  }
}
