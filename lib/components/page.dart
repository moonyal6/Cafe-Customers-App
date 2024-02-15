import 'package:flutter/material.dart';
import 'package:cafe_customers_app/components/page_components/app_bar.dart';
import 'package:cafe_customers_app/components/page_components/bottom_components/bottom_section.dart';
import 'package:cafe_customers_app/constants.dart';
import 'package:cafe_customers_app/utilities/of_screen_size.dart';

class AppPage extends StatelessWidget {
  const AppPage(
      {required this.body,
      required this.bottomSection,
      this.showAppBar = true,
      super.key});

  final Widget body;
  final bool showAppBar;
  final PageBottomSection bottomSection;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ofScreenWidth(context, kSidePaddingPercent),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Main Section
              Expanded(
                flex: 100, // 74%
                child: Column(
                  children: [
                    // App Bar
                    showAppBar
                        ? const PageAppBar()
                        : SizedBox(height: ofScreenHeight(context, 0.102) + 28),

                    // Child
                    Expanded(
                      child: SizedBox(
                        child: body,
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom Section
              Expanded(
                flex: 39, // 26%
                child: Container(
                  child: bottomSection,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
