import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCardStyle1 extends StatelessWidget {
  const InfoCardStyle1(
      {super.key,
      required this.title,
      required this.value,
      required this.image});

  final String title;
  final String value;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: 60,
            height: 60,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.getFont(
              'Roboto',
              // fo//ntWeight: FontWeight.w400,

              fontSize: 20,
              // height: 1.3,
              // letterSpacing: -0.2,
              color: const Color(0xff86868d),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: GoogleFonts.getFont(
              'Roboto',
              // fontWeight: FontWeight.w400,
              fontSize: 20,
              color: const Color(0xff86868d),
            ),
          ),
        ],
      ),
    );
  }
}
