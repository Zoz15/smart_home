import 'package:flutter/material.dart';

class CustomController extends ChangeNotifier {
  bool isRoom = true;

  void changeIsRoom() {
    isRoom = !isRoom;
    notifyListeners();
  }
}
