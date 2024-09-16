import 'package:flutter/material.dart';

class Login_or_signup extends ChangeNotifier {
  bool signupTaped = false;

  void changeIsSignup(bool value) {
    if (signupTaped != value) {
      signupTaped = value;
      notifyListeners();
    }
  }
}
