import 'dart:ui';
import 'package:flutter/material.dart';

class Microphone extends StatefulWidget {
  const Microphone({super.key});

  @override
  State<Microphone> createState() => _MicrophoneState();
}

class _MicrophoneState extends State<Microphone> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: InkWell(
        onTap: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              back_container_blur(),
              Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: isPressed ? 75 : 60,
                  width: isPressed ? 75 : 60,
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        offset: Offset(0, 4),
                        blurRadius: 20,
                        spreadRadius: 10,
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [Color(0xffdde1e8), Color(0xfff5f5f8)],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      stops: [0.2, 0.9],
                    ),
                  ),
                ),
              ),
              Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  height: isPressed ? 65 : 50,
                  width: isPressed ? 65 : 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    //color: Color(0xfff5f5f8),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xfff5f5f8),
                        Color(0xffdde1e8),
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      stops: [0.2, 0.9],
                    ),
                  ),
                ),
              ),
              Center(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: !isPressed
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 35,
                          child: Image.asset(
                            'assets/icons/mic.png',
                            key: ValueKey('mic_unpressed'),
                            fit: BoxFit.contain,
                          ),
                        )
                      : AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 40,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Color(0xff48b6fe), BlendMode.srcATop),
                            child: Image.asset(
                              'assets/icons/mic.png',
                              key: ValueKey('mic_pressed'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget back_container_blur() {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            //color: Colors.black12.withOpacity(0.03),
            border: Border.all(color: Colors.white.withOpacity(0.8), width: .5),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
