import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/component/temperatures%20slider/build_control_buttons.dart';
import 'package:smart_home/component/temperatures%20slider/info_card_style2.dart';
import 'package:smart_home/component/top_and_bottom_bar/top%20navigation%20bar.dart';
import 'package:smart_home/component/MyWidgets/my_slider_widget_2.dart';
import 'package:smart_home/var/var.dart';

class Slider_screen_num2 extends StatefulWidget {
  const Slider_screen_num2({super.key});

  @override
  State<Slider_screen_num2> createState() => _Slider_screen_num2State();
}

class _Slider_screen_num2State extends State<Slider_screen_num2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xffeef1f4),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildTemperatureControl(),
                const SizedBox(height: 30),
                _buildInfoCards(),
                const Spacer(),
                _buildControlButtons(),
                // SizedBox(height: 18),
                // _buildBottomIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        Text(
          'Thermostat',
          style: GoogleFonts.getFont(
            'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: 17,
            height: 1.3,
            letterSpacing: -0.4,
            color: const Color(0xFF000000),
          ),
        ),
        const BuildSettingIcon(),
      ],
    );
  }

  _buildTemperatureControl() {
    return SizedBox(
      //height: 270,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.width - 50,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.3),
              //borderRadius: BorderRadius.circular(10),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width - 70,
            width: MediaQuery.of(context).size.width - 70,
            decoration: BoxDecoration(
              color: Colors.white,
              //borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  offset: const Offset(0, 30),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
              ],
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width - 90,
            width: MediaQuery.of(context).size.width - 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  offset: const Offset(0, 30),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
              ],
              border: Border.all(color: Colors.black),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 165, 160, 160),
                  Colors.black,
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width - 130,
            width: MediaQuery.of(context).size.width - 130,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              //border: Border.all(color: Colors.black),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  mainColor1,
                  mainColor2,
                ],
              ),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.width - 140,
              width: MediaQuery.of(context).size.width - 140,
              child: My_slider_widget_2()),
        ],
      ),
    );
  }

  _buildInfoCards() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        //height: 130,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 30,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InfoCardStyle2(
                title: 'inside humidity',
                value: ' 49%',
                image: 'assets/vectors/info_card_1.svg'),
            SizedBox(height: 20),
            InfoCardStyle2(
                title: 'Outside temp',
                value: '10°',
                image: 'assets/vectors/info_card_2.svg'),
          ],
        ),
      ),
    );
  }

  _buildControlButtons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BuildSingelControlerButtons(
            image: 'assets/vectors/nem_1_small_button.svg', name: 'MODE'),
        // const SizedBox(width: 10),
        BuildSingelControlerButtons(
            image: 'assets/vectors/nem_2_small_button.svg', name: 'ECO'),
        // const SizedBox(width: 10),
        BuildSingelControlerButtons(
            image: 'assets/vectors/nem_3_small_button.svg', name: 'SCHEDULE'),
        // const SizedBox(width: 10),
        BuildSingelControlerButtons(
            image: 'assets/vectors/nem_4_small_button.svg', name: 'HISTORY'),
      ],
    );
  }
}
