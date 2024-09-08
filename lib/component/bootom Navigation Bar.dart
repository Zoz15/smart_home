import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 90,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.08),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  'assets/vectors/shap_right.svg',
                  fit: BoxFit.contain,
                  //height: 30,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset(
                  'assets/vectors/shap_left.svg',
                  fit: BoxFit.contain,
                  //height: 30,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIcon('assets/vectors/home_icon.svg', 40),
                      _buildIcon('assets/vectors/user_icon.svg', 45),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String icon, double size) {
    return SvgPicture.asset(
      icon,
      color: Colors.white,
      fit: BoxFit.contain,
      height: size,
    );
  }
}
