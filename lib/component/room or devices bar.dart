import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/controllers/room_and_devise_controller.dart';
import 'package:smart_home/var/var.dart';

class RoomOrDevicesBar extends StatefulWidget {
  const RoomOrDevicesBar({super.key, required this.customController});
  final RoomAndDeviseController customController;
  @override
  State<RoomOrDevicesBar> createState() => _RoomOrDevicesBarState();
}

class _RoomOrDevicesBarState extends State<RoomOrDevicesBar> {
  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   widget.customController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 25),
      child: InkWell(
        onTap: () {
          setState(() {
            // customController.isRoom = !customController.isRoom;
            widget.customController.changeIsRoom();
          });
        },
        child: Container(
          height: 35,
          width: (width - 50) + 6,
          decoration: _buildContainerDecoration(),
          child: Stack(
            children: [
              _buildAnimatedContainer(),
              Row(
                children: [
                  _buildToggleButton('Room', true),
                  _buildToggleButton('Devices', false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      border: Border.all(color: const Color(0x0D000000)),
      borderRadius: BorderRadius.circular(8),
      color: const Color.fromARGB(153, 189, 189, 194),
    );
  }

  Widget _buildAnimatedContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: widget.customController.isRoom
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: double.infinity,
          width: (width - 60) / 2,
          decoration: _buildInnerContainerDecoration(),
        ),
      ),
    );
  }

  BoxDecoration _buildInnerContainerDecoration() {
    return BoxDecoration(
      border: Border.all(color: const Color(0x0D000000)),
      borderRadius: BorderRadius.circular(8),
      color: const Color(0xFFFFFFFF),
      boxShadow: const [
        BoxShadow(
          color: Color(0x0A000000),
          offset: Offset(0, 2),
          blurRadius: 1,
        ),
        BoxShadow(
          color: Color(0x40000000),
          offset: Offset(0, 4),
          blurRadius: 2,
        ),
      ],
    );
  }

  Widget _buildToggleButton(String text, bool isRoomButton) {
    return SizedBox(
      width: (width - 50) / 2 - 1,
      child: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            height: 1.4,
            letterSpacing: -0.1,
            color: (widget.customController.isRoom && isRoomButton) ||
                    (!widget.customController.isRoom && !isRoomButton)
                ? const Color(0xFF000000)
                : const Color(0xFF808080),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
