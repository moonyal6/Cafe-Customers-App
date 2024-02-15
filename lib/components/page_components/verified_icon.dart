import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cafe_customers_app/constants.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class PageVerifiedIcon extends StatelessWidget {
  const PageVerifiedIcon(
      {this.size,
      this.color = kPrimaryColor,
      this.iconColor = kBackgroundColor,
      super.key});

  final double? size;
  final Color color;
  final Color iconColor;

  final _verifiedStarBorder = const StarBorder(
      points: 8,
      pointRounding: 0.8,
      valleyRounding: 0.2,
      innerRadiusRatio: 0.7);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(9),
      decoration: ShapeDecoration(
          color: color.withOpacity(0.07), shape: _verifiedStarBorder),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: ShapeDecoration(
          shape: _verifiedStarBorder,
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment(3, -2.5),
              colors: [color, Color(0xFF1D4D4F)]),
        ),
        child: Icon(
          size: size! * 0.40,
          weight: 800,
          Symbols.check_rounded,
          color: iconColor,
        ),
      ),
    );
  }
}
