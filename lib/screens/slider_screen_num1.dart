import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/component/MyWidgets/my_curved_drop_down.dart';
import 'package:smart_home/component/temperatures%20slider/Temperature_slider.dart';
import 'package:smart_home/component/temperatures%20slider/info_card_style1.dart';
import 'package:smart_home/component/temperatures%20slider/build_control_buttons.dart';
import 'package:smart_home/component/top_and_bottom_bar/top%20navigation%20bar.dart';

class Slider_screen_num1 extends StatefulWidget {
  const Slider_screen_num1({super.key});

  @override
  State<Slider_screen_num1> createState() => _Slider_screen_num1State();
}

class _Slider_screen_num1State extends State<Slider_screen_num1> {
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
                _buildDeviceSelector(),
                const SizedBox(height: 30),
                _buildInfoCards(),
                const SizedBox(height: 20),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textTemperatureControl(' 20°'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              textTemperatureControl('10°'),
              // const SizedBox(width: 10),
              const TemperatureSlider(),
              // const SizedBox(width: 10),
              textTemperatureControl('30°'),
            ],
          ),
        ],
      ),
    );
  }

  Text textTemperatureControl(String text) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 15,
        height: 1.3,
        letterSpacing: -0.2,
        color: const Color(0x2E3C3C43),
      ),
    );
  }

  _buildDeviceSelector() {
    //todo: add items from database
    List<String> items = ['device 1', 'device 2', 'device 3', 'device 4'];
    return Container(
      height: 50,
      //width: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFdde0e7),
        borderRadius: BorderRadius.circular(50),
      ),
      child: CurvedDropdown(items: items),
    );
  }

  _buildInfoCards() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoCardStyle1(
              title: 'inside humidity',
              value: ' 49%',
              image: 'assets/vectors/info_card_1.svg'),
          SizedBox(width: 10),
          InfoCardStyle1(
              title: 'Outside temp',
              value: '10°',
              image: 'assets/vectors/info_card_2.svg'),
        ],
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
