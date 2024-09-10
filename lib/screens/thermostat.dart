import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/component/MyWidgets/my_curved_drop_down.dart';
import 'package:smart_home/component/Temperature_slider.dart';
import 'package:smart_home/component/info_card.dart';
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffeef1f4),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(),
                const SizedBox(height: 28),
                _buildTemperatureControl(),
                const SizedBox(height: 45),
                _buildDeviceSelector(),
                SizedBox(height: 30),
                _buildInfoCards(),
                SizedBox(height: 28),
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
          InfoCard(
              title: 'inside humidity',
              value: ' 49%',
              image: 'assets/vectors/info_card_1.svg'),
          SizedBox(width: 10),
          InfoCard(
              title: 'Outside temp',
              value: '10°',
              image: 'assets/vectors/info_card_2.svg'),
        ],
      ),
    );
  }

  _buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ControlerButtons(
            image: 'assets/vectors/nem_1_small_button.svg', name: 'MODE'),
        // const SizedBox(width: 10),
        ControlerButtons(
            image: 'assets/vectors/nem_2_small_button.svg', name: 'ECO'),
        // const SizedBox(width: 10),
        ControlerButtons(
            image: 'assets/vectors/nem_3_small_button.svg', name: 'SCHEDULE'),
        // const SizedBox(width: 10),
        ControlerButtons(
            image: 'assets/vectors/nem_4_small_button.svg', name: 'HISTORY'),
      ],
    );
  }
}

class ControlerButtons extends StatefulWidget {
  final String image;
  final bool isTapped;
  final String name;
  const ControlerButtons(
      {super.key,
      required this.image,
      this.isTapped = false,
      required this.name});

  @override
  State<ControlerButtons> createState() => _ControlerButtonsState();
}

class _ControlerButtonsState extends State<ControlerButtons> {
  bool isTapped = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isTapped = widget.isTapped;
  }

  @override
  Widget build(BuildContext context) {
    double size = 70;
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          child: Container(
            height: size,
            width: size,
            child: Stack(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: isTapped
                      ? SvgPicture.asset(
                          'assets/vectors/the_small_button_taped.svg',
                          key: ValueKey('tapped'),
                          width: size,
                          height: size,
                        )
                      : SvgPicture.asset(
                          'assets/vectors/the_small_button_nottaped.svg',
                          key: ValueKey('nottapped'),
                          width: size,
                          height: size,
                        ),
                ),
                Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: SvgPicture.asset(
                      widget.image,
                      key: ValueKey(isTapped),
                      height: 50,
                      width: 50,
                      colorFilter: ColorFilter.mode(
                        isTapped ? Colors.white : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          widget.name,
          style: GoogleFonts.getFont(
            'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Color(0xff83858b),
            // height: 1.3,
            // letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }
}
