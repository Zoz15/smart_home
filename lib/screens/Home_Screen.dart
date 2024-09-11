import 'package:flutter/material.dart';
import 'package:smart_home/component/top_and_bottom_bar/bootom%20Navigation%20Bar.dart';
import 'package:smart_home/component/top_and_bottom_bar/top%20navigation%20bar.dart';
import 'package:smart_home/component/location_and_tem.dart';
import 'package:smart_home/component/room%20or%20devices%20bar.dart';
import 'package:smart_home/controllers/room_and_devise_controller.dart';
import 'package:smart_home/controllers/homeScreen_or_accScreen.dart';
import 'package:smart_home/component/Room&devices/Devices_Widget.dart';
import 'package:smart_home/component/Room&devices/Room_Widget.dart';
import 'package:smart_home/screens/log%20in%20&%20sign%20up/login_or_signup.dart';
import 'package:smart_home/var/var.dart';

double width = 0;
double height = 0;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  final RoomAndDeviseController _customController = RoomAndDeviseController();
  final HomeScreen_or_accScreen _customController2 = HomeScreen_or_accScreen();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   widget._customController.dispose();
  // }

  @override
  void initState() {
    super.initState();
    widget._customController2.addListener(() {
      setState(() {});
    });
    widget._customController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: widget._customController2.isAccScreen
                  ? const LoginOrSignup()
                  : Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 130),
                              const MyLocation(),
                              RoomOrDevicesBar(
                                  customController: widget._customController),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: widget._customController.isRoom
                                    ? const RoomWidget()
                                    : const DevicesWidget(),
                              ),
                            ],
                          ),
                        ),
                        const Align(
                            alignment: Alignment.topCenter,
                            child: TopNavigationBar()),
                      ],
                    ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MyBottomNavigationBar(
                  customController: widget._customController2),
            ),
          ],
        ),
      ),
    );
  }
}
