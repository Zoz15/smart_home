
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';



class BuildSingelControlerButtons extends StatefulWidget {
  final String image;
  final bool isTapped;
  final String name;
  const BuildSingelControlerButtons(
      {super.key,
      required this.image,
      this.isTapped = false,
      required this.name});

  @override
  State<BuildSingelControlerButtons> createState() => _BuildSingelControlerButtonsState();
}

class _BuildSingelControlerButtonsState extends State<BuildSingelControlerButtons> {
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
          child: SizedBox(
            height: size,
            width: size,
            child: Stack(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: isTapped
                      ? SvgPicture.asset(
                          'assets/vectors/the_small_button_taped.svg',
                          key: const ValueKey('tapped'),
                          width: size,
                          height: size,
                        )
                      : SvgPicture.asset(
                          'assets/vectors/the_small_button_nottaped.svg',
                          key: const ValueKey('nottapped'),
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
        const SizedBox(height: 10),
        Text(
          widget.name,
          style: GoogleFonts.getFont(
            'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: const Color(0xff83858b),
            // height: 1.3,
            // letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }
}
