import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurvedDropdown extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CurvedDropdownState createState() => _CurvedDropdownState();

  final List<String> items;
  const CurvedDropdown({super.key, required this.items});
}

class _CurvedDropdownState extends State<CurvedDropdown> {
  late String dropdownValue;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Simulate dropdown expansion/collapse when tapped
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // Smooth transition
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xffdde1e6),
          borderRadius:
              BorderRadius.circular(50), // More circular when expanded
          //border: Border.all(color: Colors.grey, width: 1),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            dropdownColor: const Color(0xffdde1e6),
            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                isExpanded = false; // Close after selection
              });
            },
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 100,
                  ),
                  child: Text(
                    value,
                    style: GoogleFonts.roboto(
                      //fontWeight: FontWeight.w600,
                      fontSize: 18,
                      //height: 1.3,
                      //letterSpacing: -0.2,
                      color: const Color.fromARGB(255, 118, 119, 124),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
