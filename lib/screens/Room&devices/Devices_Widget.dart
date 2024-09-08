import 'package:flutter/material.dart';
import 'package:smart_home/screens/Room&devices/one%20card.dart';

class DevicesWidget extends StatefulWidget {
  const DevicesWidget({super.key});

  @override
  State<DevicesWidget> createState() => _DevicesWidgetState();
}

class _DevicesWidgetState extends State<DevicesWidget> {
  
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 120),
      child: Wrap(
        children: [
          //TODO: add the rooms and devices count
          OneCard(
            isDevice: true,
            roomName_or_devicesName: 'Heater',
            devicesCount: '4 devices',
            image: 'assets/images/heater.png',
          ),
          OneCard(
              isDevice: true,
              roomName_or_devicesName: 'Lights',
              devicesCount: '8 devices',
              image: 'assets/images/light.png'),
          OneCard(
              isDevice: true,
              roomName_or_devicesName: 'Geyser',
              devicesCount: '2 devices',
              image: 'assets/images/geyser.png'),
          OneCard(
              isDevice: true,
              roomName_or_devicesName: 'TV',
              devicesCount: '1 device',
              image: 'assets/images/tv.png'),
        ],
      ),
    );
  }
}
