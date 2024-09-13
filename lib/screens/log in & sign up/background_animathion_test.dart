import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/var/var.dart';

class Animathon_background extends StatelessWidget {
  Animathon_background({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Animated_background_card(color: mainColor1),
        Animated_background_card(color: mainColor2),
      ],
    );
  }
}

class Animated_background_card extends StatefulWidget {
  const Animated_background_card({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  State<Animated_background_card> createState() => _Animated_background_cardState();
}

class _Animated_background_cardState extends State<Animated_background_card>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: widget.color,
            spawnMaxRadius: 20,
            spawnMinSpeed: 15,
            particleCount: 50,
            spawnMaxSpeed: 40,
            minOpacity: 0.5,
            maxOpacity: 0.8,
            //opacityChangeRate: 0.001,
            //particleCount: 100,
          ),
        ),
        child: Container(),
      );
  }
}
