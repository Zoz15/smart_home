import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home/component/top_and_bottom_bar/microphone.dart';
import 'package:smart_home/controllers/homeScreen_or_accScreen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key, required this.customController});
  final HomeScreen_or_accScreen customController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        bottomNavigationBar_without_mic(context),
        const Microphone(),
      ],
    );
  }

  ClipRect bottomNavigationBar_without_mic(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: SizedBox(
          height: 90,
          width: MediaQuery.of(context).size.width,
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
                      InkWell(
                        onTap: () {
                          customController.changeIsAccScreen(false);
                        },
                        child: _buildIcon('assets/vectors/home_icon.svg', 40),
                      ),
                      InkWell(
                        onTap: () {
                          customController.changeIsAccScreen(true);
                        },
                        child: _buildIcon('assets/vectors/user_icon.svg', 45),
                      ),
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
