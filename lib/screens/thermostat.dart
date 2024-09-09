import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/component/Temperature_slider.dart';
import 'package:smart_home/component/top_and_bottom_bar/top%20navigation%20bar.dart';

class Thermostat extends StatefulWidget {
  const Thermostat({super.key});

  @override
  State<Thermostat> createState() => _ThermostatState();
}

class _ThermostatState extends State<Thermostat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            const SizedBox(height: 28),
            _buildTemperatureControl(),
            const SizedBox(height: 45),
            // _buildDeviceSelector(),
            // SizedBox(height: 30),
            // _buildInfoCards(),
            // SizedBox(height: 28),
            // _buildControlButtons(),
            // SizedBox(height: 18),
            // _buildBottomIndicator(),
          ],
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
            'Roboto Condensed',
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
          textTemperatureControl('20°'),
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
        'Roboto Condensed',
        fontWeight: FontWeight.w400,
        fontSize: 15,
        height: 1.3,
        letterSpacing: -0.2,
        color: const Color(0x2E3C3C43),
      ),
    );
  }
}
