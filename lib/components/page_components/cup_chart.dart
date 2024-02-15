import 'dart:math';
import 'package:flutter/material.dart';

class PageCupChart extends StatelessWidget {
  const PageCupChart(
      {super.key, required this.diameter, required this.circumference});

  final double diameter;
  final double circumference;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          size: Size(diameter, diameter),
          painter: CirclePainter(diameter, circumference),
        ),
      ],
    );
  }
}


class CirclePainter extends CustomPainter {
  final double diameter;
  final double circumference;

  CirclePainter(this.diameter, this.circumference);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      diameter / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
