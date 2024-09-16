import 'package:flutter/material.dart';

class HomeScreen_or_accScreen extends ChangeNotifier {
  bool isAccScreen = false;
  // bool isAccScreen = true;

  void changeIsAccScreen(bool value) {
    isAccScreen = value;
    notifyListeners();
  }
}
