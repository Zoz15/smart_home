import 'package:flutter/material.dart';
import 'package:smart_home/var/var.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    required double changWidth1,
    required double changHight1,
    required double sizeofContaner,
  })  : _changWidth1 = changWidth1,
        _changHight1 = changHight1,
        _sizeofContaner = sizeofContaner;

  final double _changWidth1;
  final double _changHight1;
  final double _sizeofContaner;

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: double.infinity,
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn,
        transform: Matrix4.translationValues(_changWidth1, _changHight1, 0),
        width: _sizeofContaner,
        height: _sizeofContaner,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [mainColor1, mainColor2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
