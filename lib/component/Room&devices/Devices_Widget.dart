import 'package:flutter/material.dart';
import 'package:smart_home/component/Room&devices/one%20card.dart';
import 'package:smart_home/screens/slider%20screen/slider_screen_num2.dart';

class DevicesWidget extends StatefulWidget {
  const DevicesWidget({super.key});

  @override
  State<DevicesWidget> createState() => _DevicesWidgetState();
}

class _DevicesWidgetState extends State<DevicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: Wrap(
        children: [
          //TODO: add the rooms and devices count
          OneCard(
            isDevice: true,
            roomName_or_devicesName: 'Heater',
            devicesCount: '4 devices',
            image: 'assets/images/heater.png',
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Slider_screen_num2()));
            },
          ),
          const OneCard(
              isDevice: true,
              roomName_or_devicesName: 'Lights',
              devicesCount: '8 devices',
              image: 'assets/images/light.png'),
          const OneCard(
              isDevice: true,
              roomName_or_devicesName: 'Geyser',
              devicesCount: '2 devices',
              image: 'assets/images/geyser.png'),
          const OneCard(
              isDevice: true,
              roomName_or_devicesName: 'TV',
              devicesCount: '1 device',
              image: 'assets/images/tv.png'),
        ],
      ),
    );
  }
}
