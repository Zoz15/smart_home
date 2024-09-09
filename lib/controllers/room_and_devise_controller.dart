import 'package:flutter/material.dart';

class RoomAndDeviseController extends ChangeNotifier {
  bool isRoom = true;

  void changeIsRoom() {
    isRoom = !isRoom;
    notifyListeners();
  }
}
