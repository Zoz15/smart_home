import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TemperatureSlider extends StatefulWidget {
  const TemperatureSlider({super.key});

  @override
  State<TemperatureSlider> createState() => _TemperatureSliderState();
}

class _TemperatureSliderState extends State<TemperatureSlider> {
  double _rotationValue = 0;
  Offset? _lastPosition;

  void _onPanStart(DragStartDetails details) {
    _lastPosition = details.localPosition;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final center =
        Offset(100, 100); // center of the circle
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
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFD8DEE9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(4, 4),
              blurRadius: 10,
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
          child: SizedBox(
            height: 170,
            width: 170,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black26.withOpacity(0.5)),
                  gradient: const LinearGradient(
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
}
