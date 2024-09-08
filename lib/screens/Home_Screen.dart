import 'package:flutter/material.dart';
import 'package:smart_home/component/bootom%20Navigation%20Bar.dart';
import 'package:smart_home/component/microphone.dart';
import 'package:smart_home/component/top%20navigation%20bar.dart';
import 'package:smart_home/component/location_and_tem.dart';
import 'package:smart_home/component/room%20or%20devices%20bar.dart';
import 'package:smart_home/controllers/custom_controller.dart';
import 'package:smart_home/screens/Room&devices/Devices_Widget.dart';
import 'package:smart_home/screens/Room&devices/Room_Widget.dart';

double width = 0;
double height = 0;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  final CustomController _customController = CustomController();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget._customController.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._customController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 130),
                  MyLocation(),
                  RoomOrDevicesBar(customController: widget._customController),
                  //Card1(),
                  //Card1()
                  // RoomBar(),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: widget._customController.isRoom
                        ? RoomWidget()
                        : DevicesWidget(),
                  ),
                ],
              ),
            ),
            Align(alignment: Alignment.topCenter, child: TopNavigationBar()),
            Align(
                alignment: Alignment.bottomCenter,
                child: MyBottomNavigationBar()),
            Align(alignment: Alignment.bottomCenter, child: Microphone()),
          ],
        ),
      ),
    );
  }
}
