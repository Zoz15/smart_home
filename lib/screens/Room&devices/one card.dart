import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/screens/Home_Screen.dart';

const double _kRadius = 25;
const Radius _radius = Radius.circular(_kRadius);

class OneCard extends StatefulWidget {
  const OneCard({
    super.key,
    required this.roomName,
    required this.image,
    required this.devicesCount,
    this.isOn = false,
  });

  final String roomName;
  final String devicesCount;
  final String image;
  final bool isOn;

  @override
  State<OneCard> createState() => _OneCardState();
}

class _OneCardState extends State<OneCard> {
  late bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.isOn;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 240,
        width: (width - 60) / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_kRadius),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildImageSection(),
            _buildInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            width: (width - 60) / 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: _radius,
                topRight: _radius,
              ),
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.3),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    //todo: add more options
                  },
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.roomName,
              style: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                height: 1.3,
                color: const Color(0x993C3C43),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.devicesCount,
              style: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                height: 1.2,
                color: const Color(0x993C3C43),
              ),
            ),
            const SizedBox(height: 10),
            _buildToggleRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: Text(
            _isOn ? 'ON  ' : 'OFF',
            key: ValueKey<bool>(_isOn),
            style: GoogleFonts.robotoCondensed(
              fontWeight: FontWeight.w400,
              fontSize: 22,
              height: 1.3,
              letterSpacing: 0.3,
              color: const Color(0x993C3C43),
            ),
          ),
        ),
        _buildToggleSwitch(),
      ],
    );
  }

  Widget _buildToggleSwitch() {
    return InkWell(
      onTap: () {
        setState(() {
          _isOn = !_isOn;
        });
      },
      child: Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[Color(0xFFC9CED7), Color(0xFFE1EAF1)],
            stops: <double>[0, 1],
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment: _isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: AnimatedContainer(
            height: 30,
            width: 30,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: const Alignment(-1.046, -1),
                end: const Alignment(1.067, 1.104),
                colors: <Color>[
                  _isOn ? const Color(0xFF779BE7) : const Color(0xFFE1EAF1),
                  _isOn ? const Color(0xFFA480CF) : const Color(0xFFC9CED7),
                ],
                stops: const <double>[0, 1],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x4D6D222B),
                  offset: Offset(1, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
