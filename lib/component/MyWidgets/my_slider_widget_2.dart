import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class My_slider_widget_2 extends StatefulWidget {
  @override
  _My_slider_widget_2State createState() => _My_slider_widget_2State();
}

class _My_slider_widget_2State extends State<My_slider_widget_2> {
  double _currentValue = 10.0;
  final double _minValue = 10;
  final double _maxValue = 70;
  Offset _center = Offset.zero;
  Offset? _previousPosition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: (details) {
        _previousPosition = null;
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          _center = Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);

          return CustomPaint(
            size: Size(200, 200),
            painter: CircularSliderPainter(
                currentValue: _currentValue,
                minValue: _minValue,
                maxValue: _maxValue),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(),
                  _buildValueDisplay(),
                  _buildEcoIcon(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onPanUpdate(DragUpdateDetails details) {
    Offset localPosition = details.localPosition - _center;

    if (_previousPosition != null) {
      Offset previousOffset = _previousPosition! - _center;
      double previousAngle = atan2(previousOffset.dy, previousOffset.dx);
      double currentAngle = atan2(localPosition.dy, localPosition.dx);

      double angleDifference = (currentAngle - previousAngle) * 180 / pi;

      if (angleDifference.abs() > 180) {
        angleDifference = (angleDifference > 0)
            ? angleDifference - 360
            : angleDifference + 360;
      }

      setState(() {
        double anglePerTick = 240 / (_maxValue - _minValue);
        _currentValue += angleDifference / anglePerTick;
        _currentValue = _currentValue.clamp(_minValue, _maxValue);
      });
    }

    _previousPosition = details.localPosition;
  }

  Widget _buildHeader() {
    return Text(
      "HEATING",
      style: GoogleFonts.roboto(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          // height: 1.4,
          // letterSpacing: -0.1,
          color: Colors.white),
    );
  }

  Widget _buildValueDisplay() {
    return Text(
      "${_currentValue.round()}",
      style: GoogleFonts.roboto(
          fontWeight: FontWeight.w600,
          fontSize: 60,
          // height: 1.4,
          // letterSpacing: -0.1,
          color: Colors.white),
    );
  }

  Widget _buildEcoIcon() {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      firstChild: SvgPicture.asset(
        'assets/vectors/tree_paper.svg',
        width: 30,
        fit: BoxFit.contain,
      ),
      secondChild: SvgPicture.asset(
        'assets/vectors/tree_paper_gray.svg',
        width: 30,
        fit: BoxFit.contain,
      ),
      crossFadeState: _currentValue.round() < 41
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}

class CircularSliderPainter extends CustomPainter {
  final double currentValue;
  final double minValue;
  final double maxValue;

  CircularSliderPainter(
      {required this.currentValue,
      required this.minValue,
      required this.maxValue});

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height) / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.translate(center.dx, center.dy);
    canvas.rotate(90 * pi / 180);
    canvas.translate(-center.dx, -center.dy);

    _drawTicks(canvas, center, radius);
  }

  void _drawTicks(Canvas canvas, Offset center, double radius) {
    double anglePerTick = 240 / (maxValue - minValue);

    for (int i = minValue.round(); i <= maxValue.round(); i++) {
      double angle = 60 + (anglePerTick * (i - minValue));
      Paint paint = Paint()
        ..color = (i == currentValue.round())
            ? Colors.white
            : Colors.white.withOpacity(.4)
        ..strokeWidth = 2.0;

      double startX = center.dx + radius * cos(_degreesToRadians(angle));
      double startY = center.dy + radius * sin(_degreesToRadians(angle));

      double endX = center.dx + (radius - 25) * cos(_degreesToRadians(angle));
      double endY = center.dy + (radius - 25) * sin(_degreesToRadians(angle));

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
