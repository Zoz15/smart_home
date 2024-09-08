import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color(0xF0F9F9F9).withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHomeIcon(),
                _buildUserIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildGradientIcon(Icons.home),
        const SizedBox(height: 4),
        _buildGradientBar(),
      ],
    );
  }

  Widget _buildGradientIcon(IconData icon) {
    return SizedBox(
      width: 30,
      height: 30,
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) => _createGradient().createShader(bounds),
        child: Icon(icon, size: 30),
      ),
    );
  }

  Widget _buildGradientBar() {
    return Container(
      height: 2,
      width: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: _createGradient(),
      ),
    );
  }

  Widget _buildUserIcon() {
    return const SizedBox(
      width: 25,
      height: 25,
      child: Icon(Iconsax.user),
    );
  }

  LinearGradient _createGradient() {
    return const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xff5dabf5), Color(0xFFA480CF)],
    );
  }
}
