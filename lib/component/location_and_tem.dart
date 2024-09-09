import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/var/var.dart';

class MyLocation extends StatelessWidget {
  const MyLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Container(
        height: 120,
        decoration: _buildContainerDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _buildHeaderRow(),
              const SizedBox(height: 15),
              _buildWeatherDetailsRow(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: LinearGradient(
        begin: const Alignment(-1.046, -1),
        end: const Alignment(1.067, 1.104),
        colors: [mainColor1, mainColor2],
        stops: const [0, 1],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText('My Location', 22, FontWeight.w600),
            _buildText('New Delhi', 13, FontWeight.w400,
                color: const Color(0x99EBEBF5)),
          ],
        ),
        _buildText('8°', 48, FontWeight.w300, height: 1),
      ],
    );
  }

  Widget _buildWeatherDetailsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 15,
          width: 15,
          child: SvgPicture.asset('assets/vectors/vector_3_x2.svg'),
        ),
        const SizedBox(width: 5),
        _buildText('Partly Cloudy', 13, FontWeight.w400,
            color: const Color(0x99EBEBF5)),
        const Spacer(),
        _buildText('H: 16° L: 6°', 13, FontWeight.w400,
            color: const Color(0x99EBEBF5)),
      ],
    );
  }

  Widget _buildText(String text, double fontSize, FontWeight fontWeight,
      {Color color = Colors.white, double? height}) {
    return Text(
      text,
      style: GoogleFonts.robotoCondensed(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        height: height,
      ),
    );
  }
}
