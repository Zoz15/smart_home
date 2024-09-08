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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        //height: 6000,
        //color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.only(bottom: 120),
          child: Wrap(
            children: [
              //TODO: add the rooms and devices count
              OneCard(
                roomName: 'Master Bedroom',
                devicesCount: '4 devices',
                image: 'assets/images/image.jpeg',
              ),
              OneCard(
                  roomName: 'Living Room',
                  devicesCount: '8 devices',
                  image: 'assets/images/image_3.jpeg'),
              OneCard(
                  roomName: 'Kitchen',
                  devicesCount: '5 devices',
                  image: 'assets/images/image_4.jpeg'),
              OneCard(
                  roomName: 'Bathroom',
                  devicesCount: '2 devices',
                  image: 'assets/images/image_1.jpeg'),
            ],
          ),
        ),
      ),
    );
  }
}
