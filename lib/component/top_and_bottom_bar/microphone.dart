import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Microphone extends StatefulWidget {
  const Microphone({super.key});

  @override
  State<Microphone> createState() => _MicrophoneState();
}

class _MicrophoneState extends State<Microphone> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: _togglePressed,
        child: _buildMicrophoneButton(),
      ),
    );
  }

  void _togglePressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  Widget _buildMicrophoneButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 90,
      width: 90,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Stack(
        children: [
          _buildBackgroundBlur(),
          _buildOuterCircle(),
          _buildInnerCircle(),
          _buildMicrophoneIcon(),
        ],
      ),
    );
  }

  Widget _buildBackgroundBlur() {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            border:
                Border.all(color: Colors.white.withOpacity(0.8), width: 0.5),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildOuterCircle() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: _isPressed ? 75 : 60,
        width: _isPressed ? 75 : 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 10,
            ),
          ],
          gradient: const LinearGradient(
            colors: [Color(0xffdde1e8), Color(0xfff5f5f8)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            stops: [0.2, 0.9],
          ),
        ),
      ),
    );
  }

  Widget _buildInnerCircle() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: _isPressed ? 65 : 50,
        width: _isPressed ? 65 : 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xfff5f5f8), Color(0xffdde1e8)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            stops: [0.2, 0.9],
          ),
        ),
      ),
    );
  }

  Widget _buildMicrophoneIcon() {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: _isPressed ? _buildPressedMicIcon() : _buildUnpressedMicIcon(),
      ),
    );
  }

  Widget _buildUnpressedMicIcon() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 35,
      child: SvgPicture.asset(
        'assets/vectors/mic.svg',
        key: const ValueKey('mic_pressed'),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildPressedMicIcon() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 40,
      child: ColorFiltered(
        colorFilter:
            const ColorFilter.mode(Color(0xff48b6fe), BlendMode.srcATop),
        child: SvgPicture.asset(
          'assets/vectors/mic.svg',
          key: const ValueKey('mic_pressed'),
          height: 30,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
