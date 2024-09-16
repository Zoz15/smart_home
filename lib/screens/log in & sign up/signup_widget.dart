import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/controllers/login_or_signup.dart';
import 'package:smart_home/var/var.dart';

class SignupWidget extends StatefulWidget {
  final Login_or_signup login_or_signup;
  const SignupWidget({super.key, required this.login_or_signup});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget>
    with SingleTickerProviderStateMixin {
  bool isEmailValid = false;
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool emptyFields = false;

  @override
  void initState() {
    super.initState();
    widget.login_or_signup.addListener(_updateState);
  }

  @override
  void dispose() {
    widget.login_or_signup.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    if (mounted) {
      setState(() {
        // Update state if needed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(25),
          height: height / 1.8,
          width: width * .75,
          decoration: _buildCardDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // _buildWelcomeText(),
              _buildLoginFields(),

              _buildLoginButton(),
              _buildSignupPrompt(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white.withOpacity(0.2)),
      boxShadow: [
        BoxShadow(
          color: mainColor1.withOpacity(0.1),
          blurRadius: 20,
          spreadRadius: 5,
        ),
      ],
    );
  }

  Widget _buildLoginFields() {
    return Column(
      children: [
        _buildTextField(obscureText: false, hintText: 'Name'),
        _buildTextField(obscureText: false, hintText: 'Phone Number'),
        _buildTextField(obscureText: false, hintText: 'Email'),
        _buildTextField(obscureText: true, hintText: 'Password'),
        _buildTextField(obscureText: true, hintText: 'Confirm Password'),
      ],
    );
  }

  Widget _buildTextField(
      {required bool obscureText, required String hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        onChanged: (value) => _handleTextFieldChange(hintText, value),
        obscureText: obscureText,
        style: _getTextStyle(mainColor3),
        decoration: _getInputDecoration(hintText),
      ),
    );
  }

  void _handleTextFieldChange(String hintText, String value) {
    setState(() {
      switch (hintText) {
        case 'Email':
          email = value;
          isEmailValid = EmailValidator.validate(value);
          break;
        case 'Password':
          password = value;
          break;
        case 'Name':
          name = value;
          break;
        case 'Phone Number':
          phoneNumber = value;
          break;
        case 'Confirm Password':
          confirmPassword = value;
          break;
      }
    });
  }

  TextStyle _getTextStyle(Color color) {
    return GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: color,
    );
  }

  InputDecoration _getInputDecoration(String hintText) {
    return InputDecoration(
      fillColor: Colors.white.withOpacity(0.5),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      hintText: hintText,
      hintStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: mainColor3.withOpacity(.7),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: mainColor1.withOpacity(0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: mainColor1.withOpacity(0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: mainColor1),
      ),
      errorText: (hintText == 'Email' || hintText == 'Owner Email') &&
              !isEmailValid &&
              email.isNotEmpty
          ? 'Invalid email'
          : null,
      errorStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: mainColor2,
      ),
    );
  }

  Widget _buildLoginButton() {
    return Column(
      children: [
        InkWell(
          onTap: _handleSignup,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [mainColor1, mainColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              'Signup',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (emptyFields)
          Center(
            child: Text(
              'Please fill all fields',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: mainColor2,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSignupPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: mainColor3.withOpacity(.7),
          ),
        ),
        InkWell(
          onTap: () {
            widget.login_or_signup.changeIsSignup(false);
          },
          child: Text(
            '  Login',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: mainColor2,
            ),
          ),
        ),
      ],
    );
  }

  bool _validateFields() {
    return isEmailValid &&
        password.isNotEmpty &&
        email.isNotEmpty &&
        name.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        confirmPassword.isNotEmpty;
  }

  void _handleSignup() {
    setState(() {
      emptyFields = false;
    });
    if (_validateFields()) {
      _performSignup();
    } else {
      setState(() {
        emptyFields = true;
      });
    }
  }

  void _performSignup() {
    //TODO: signup
    print('signup');
  }
}
