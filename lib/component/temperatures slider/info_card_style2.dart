import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCardStyle2 extends StatelessWidget {
  const InfoCardStyle2(
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
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
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
          // const SizedBox(width: 10),
          const Spacer(),
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
