import 'package:flutter/material.dart';
import 'package:smart_home/component/bootom%20Navigation%20Bar.dart';
import 'package:smart_home/component/microphone.dart';
import 'package:smart_home/component/top%20navigation%20bar.dart';
import 'package:smart_home/component/my%20location.dart';
import 'package:smart_home/component/room%20or%20devices%20bar.dart';
import 'package:smart_home/screens/Room&devices/Room_Bar.dart';

double width = 0;
double height = 0;
bool isRoom = true;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 130),
                  MyLocation(),
                  RoomOrDevicesBar(),
                  //Card1(),
                  //Card1()
                  RoomBar(),
                  //isRoom ? RoomBar() : DeviceBar(),
                ],
              ),
            ),
            Align(alignment: Alignment.topCenter, child: TopNavigationBar()),
            Align(
                alignment: Alignment.bottomCenter,
                child: MyBottomNavigationBar()),
            Align(
                alignment: Alignment.bottomCenter,
                child: Microphone()),
          ],
        ),
      ),
    );
  }
}
