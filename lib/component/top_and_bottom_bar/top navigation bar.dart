import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TopNavigationBar extends StatefulWidget {
  const TopNavigationBar({super.key});

  @override
  State<TopNavigationBar> createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            color: const Color(0xF0F9F9F9).withOpacity(0.6),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 26.25, 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 1.5),
                      child: Text(
                        'Home',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          letterSpacing: 0.4,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                    const BuildSettingIcon(),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Family Members',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 1.2,
                        letterSpacing: 0.4,
                        color: const Color(0x993C3C43),
                      ),
                    ),
                    Stack(
                      children: [
                        _buildCircleAvatar('assets/images/ellipse_4.png', 0),
                        _buildCircleAvatar('assets/images/ellipse_3.png', 20),
                        _buildCircleAvatar('assets/images/ellipse_2.png', 40),
                        _buildCircleAvatar('assets/images/ellipse_1.png', 60),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircleAvatar(String image, double leftPadding) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Container(
        width: 29,
        height: 29,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.5),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: CircleAvatar(
          radius: 13.5,
          backgroundImage: AssetImage(image),
        ),
      ),
    );
  }
}

class BuildSettingIcon extends StatelessWidget {
  const BuildSettingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isReversed = false;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return GestureDetector(
          onTapDown: (_) {
            setState(() {
              isReversed = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              isReversed = false;
            });
          },
          onTapCancel: () {
            setState(() {
              isReversed = false;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: const Alignment(-0.861, -0.861),
                end: const Alignment(1, 1),
                colors: isReversed
                    ? <Color>[
                        const Color(0xFFF8FBFF),
                        const Color.fromARGB(255, 194, 199, 207)
                      ]
                    : <Color>[
                        const Color.fromARGB(255, 194, 199, 207),
                        const Color(0xFFF8FBFF)
                      ],
                stops: const <double>[0, 1],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A3B4056),
                  offset: Offset(4, 4),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(7.2),
              height: 36,
              width: 36,
              child: SvgPicture.asset(
                'assets/vectors/settings.svg',
                color: Colors.black54,
              ),
            ),
          ),
        );
      },
    );
  }
}
