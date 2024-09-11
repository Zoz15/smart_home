import 'dart:math';

import 'package:flutter/material.dart';

class My_slider_widget_1 extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final List<Color> gradientColors;

  My_slider_widget_1({
    required this.progress,
    required this.strokeWidth,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double radius = (size.width - strokeWidth) / 2;
    Offset center = Offset(size.width / 2, size.height / 2);
    double sweepAngle = 2 * pi * progress;

    Rect rect = Rect.fromCircle(center: center, radius: radius);
    Gradient gradient = SweepGradient(
      startAngle: -pi / 2,
      endAngle: 3 * pi / 2,
      colors: gradientColors,
      stops: const [0.0, 1.0],
    );

    paint.shader = gradient.createShader(rect);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
