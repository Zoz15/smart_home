import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Microphone extends StatefulWidget {
  const Microphone({super.key});

  @override
  State<Microphone> createState() => _MicrophoneState();
}

class _MicrophoneState extends State<Microphone> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          back_container_blur(),
          Center(
            child: Container(
              //padding: const EdgeInsets.all(10),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/vectors/siri.svg',
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }

  Widget back_container_blur() {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            // color: Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
