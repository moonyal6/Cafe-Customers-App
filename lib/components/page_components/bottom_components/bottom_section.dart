import 'package:flutter/material.dart';
import 'navigation_button.dart';

class PageBottomSection extends StatelessWidget {
  const PageBottomSection(
      {this.buttonLabel,
      this.showButtonLabel = true,
      this.button,
      this.navigationButtons,
      super.key});

  final bool showButtonLabel;
  final String? buttonLabel;
  final Widget? button;
  final List<Widget>? navigationButtons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Button
        button != null ? button! : const SizedBox(height: 68),

        // Navigation Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: navigationButtons != null ? navigationButtons! : [],
        ),
      ],
    );
  }
}
