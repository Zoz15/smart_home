import 'package:flutter/material.dart';
import 'package:smart_home/screens/Room&devices/one%20card.dart';

class RoomBar extends StatefulWidget {
  const RoomBar({super.key});

  @override
  State<RoomBar> createState() => _RoomBarState();
}

class _RoomBarState extends State<RoomBar> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 120),
      child: Wrap(
        children: [
          //TODO: add the rooms and devices count
          OneCard(
            roomName_or_devicesName: 'Master Bedroom',
            devicesCount: '4 devices',
            image: 'assets/images/image.jpeg',
          ),
          OneCard(
              roomName_or_devicesName: 'Living Room',
              devicesCount: '8 devices',
              image: 'assets/images/image_3.jpeg'),
          OneCard(
              roomName_or_devicesName: 'Kitchen',
              devicesCount: '5 devices',
              image: 'assets/images/image_4.jpeg'),
          OneCard(
              roomName_or_devicesName: 'Bathroom',
              devicesCount: '2 devices',
              image: 'assets/images/image_1.jpeg'),
        ],
      ),
    );
  }
}
