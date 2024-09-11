import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/component/MyWidgets/my_slider_widget_1.dart';

class TemperatureSlider extends StatefulWidget {
  const TemperatureSlider({super.key});

  @override
  State<TemperatureSlider> createState() => _TemperatureSliderState();
}

class _TemperatureSliderState extends State<TemperatureSlider> {
  double _rotationValue = 0;
  Offset? _lastPosition;
  double get temperature =>
      10 + (_rotationValue / 180) * 20; // 10 to 30 degrees

  double get progressValue {
    return (temperature - 10) / 20 * 0.5 + 0.5;
  }

  void _onPanStart(DragStartDetails details) {
    _lastPosition = details.localPosition;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final center = const Offset(100, 100); // center of the circle
    final currentPosition = details.localPosition;

    if (_lastPosition != null) {
      final angle1 =
          atan2(_lastPosition!.dy - center.dy, _lastPosition!.dx - center.dx);
      final angle2 =
          atan2(currentPosition.dy - center.dy, currentPosition.dx - center.dx);

      // calculate
      double angleDelta = angle2 - angle1;

      //range of -pi to pi
      if (angleDelta > pi) {
        angleDelta -= 2 * pi;
      } else if (angleDelta < -pi) {
        angleDelta += 2 * pi;
      }

      setState(() {
        _rotationValue += angleDelta * 180 / pi;

        //  between 0 and 180
        if (_rotationValue < 0) {
          _rotationValue = 0;
        } else if (_rotationValue > 180) {
          _rotationValue = 180;
        }
      });
    }

    _lastPosition = currentPosition; // update the last position
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: 270,
      child: Stack(
        children: [
          _buildFirstContainer(),
          _buildSvgMoneySlider(),
          _buildShadow(),
          _buildCircularProgress(),
          _buildSecondContainer(),
          _buildCenterContainer(),
          _buildRotatingKnob(),
        ],
      ),
    );
  }

  Widget _buildFirstContainer() {
    return Center(
      child: Container(
        height: 240,
        width: 240,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.18),
              offset: const Offset(0, 40),
              blurRadius: 40,
            ),
          ],
          color: Colors.grey.shade300,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black26),
        ),
      ),
    );
  }

  Widget _buildSvgMoneySlider() {
    return Align(
      alignment: Alignment.topCenter,
      child: SvgPicture.asset(
        'assets/vectors/maney_.svg',
        width: 270,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildShadow() {
    return Center(
      child: SvgPicture.asset(
        'assets/vectors/shadow.svg',
        width: 250,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildSecondContainer() {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFD8DEE9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.18),
              offset: const Offset(0, 40),
              blurRadius: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterContainer() {
    return Center(
      child: Container(
        height: 170,
        width: 170,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFFD8DEE9), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              'HEATING',
              style: GoogleFonts.getFont(
                'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: 17,
                height: 1.3,
                letterSpacing: -0.4,
                color: const Color(0x993C3C43),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              '${temperature.toInt()}°',
              style: GoogleFonts.getFont(
                'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 54,
                height: 0.6,
                letterSpacing: 0.3,
                color: const Color(0x2E3C3C43),
              ),
            ),
            const SizedBox(height: 40),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              firstChild: SvgPicture.asset(
                'assets/vectors/tree_paper.svg',
                width: 20,
                fit: BoxFit.contain,
              ),
              secondChild: SvgPicture.asset(
                'assets/vectors/tree_paper_gray.svg',
                width: 20,
                fit: BoxFit.contain,
              ),
              crossFadeState: temperature < 21
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRotatingKnob() {
    return Center(
      child: GestureDetector(
        onPanUpdate: _onPanUpdate,
        onPanStart: _onPanStart,
        child: Transform.rotate(
          angle: _rotationValue * 0.0174533,
          child: Container(
            height: 160,
            width: 160,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // border: Border.all(color: Colors.black26.withOpacity(0.5)),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  //border: Border.all(color: Colors.black26.withOpacity(0.1)),
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xFFD8DEE9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildCircularProgress() {
    return Center(
      child: RotatedBox(
        quarterTurns: 1,
        child: SizedBox(
          height: 225,
          width: 225,
          child: CustomPaint(
            painter: My_slider_widget_1(
              progress: progressValue,
              strokeWidth: 15,
              gradientColors: [
                const Color(0xff9c5edb),
                const Color(0xffcc5890),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
