import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/screens/Home_Screen.dart';
import 'package:smart_home/screens/log%20in%20&%20sign%20up/background_animathion.dart';
import 'package:smart_home/var/var.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  bool isEmailValid = false;
  String email = '';
  String password = '';

  bool emptyEmailOrPassword = false;

  bool goto2screen = false;
  bool endanim = false;

  double _changHight1 = height - 850;
  double _changWidth1 = width - 300;
  //?2
  double _changHight2 = -140;
  double _changWidth2 = -25;
  //
  double _changHight3 = height - 1260;
  double _changWidth3 = width - 100;

  final double _sizeofContaner = 550.0;

  void _moveCircles() {
    setState(() {
      _changHight1 = _changHight1 == -180.0 ? height - 850 : -180.0;
      _changWidth1 = _changWidth1 == -180.0 ? width - 300 : -180.0;
      //?2
      _changHight2 = _changHight2 == height - 700 ? -140 : height - 700;
      _changWidth2 = _changWidth2 == width - 100 ? -25 : width - 100;
      //?3
      _changHight3 =
          _changHight3 == height - 1260 ? height - 450 : height - 1260;
      _changWidth3 = _changWidth3 == width - 100 ? width - 450 : width - 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: whiteColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Circle(
              changWidth1: _changWidth1,
              changHight1: _changHight1,
              sizeofContaner: _sizeofContaner,
            ),
            Circle(
              changWidth1: _changWidth2,
              changHight1: _changHight2,
              sizeofContaner: 130,
            ),
            Circle(
              changWidth1: _changWidth3,
              changHight1: _changHight3,
              sizeofContaner: 170,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      height: height / 2,
                      width: width * .75,
                      decoration: BoxDecoration(
                        color: mainColor3.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(height: 1),
                          Text(
                            'Welcome',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.white,
                              //height: height,
                            ),
                          ),
                          SizedBox(height: 1),
                          _bildeTextField(
                              obscureText: false, hintText: 'Email'),
                          _bildeTextField(
                              obscureText: true, hintText: 'Password'),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                //TODO: forgot password
                              },
                              child: Text(
                                'Forgot Password?',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: mainColor4,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  //TODO: login
                                  setState(() {
                                    emptyEmailOrPassword = false;
                                  });
                                  if (isEmailValid &&
                                      password != '' &&
                                      email != '') {
                                    _moveCircles();
                                    print(email);
                                    print(password);
                                  } else {
                                    setState(() {
                                      emptyEmailOrPassword = true;
                                    });
                                  }
                                },
                                child: Container(
                                  //width: width,
                                  //height: 50,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 25),
                                  decoration: BoxDecoration(
                                    color: whiteColor.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              if (emptyEmailOrPassword)
                                Center(
                                  child: Text(
                                    'No email or password',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(.7),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  //TODO: signup
                                },
                                child: Text(
                                  '  Signup',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: mainColor4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField _bildeTextField(
      {required bool obscureText, required String hintText}) {
    return TextField(
      onSubmitted: (value) {
        if (hintText == 'Email') {
          setState(() {
            isEmailValid = EmailValidator.validate(value);
          });
        }
      },
      onChanged: (value) {
        if (hintText == 'Email') {
          setState(() {
            email = value;
            isEmailValid = EmailValidator.validate(value);
          });
        } else if (hintText == 'Password') {
          password = value;
        }
      },
      obscureText: obscureText,
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(.3),
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        errorText: hintText == 'Email' && !isEmailValid && email.isNotEmpty
            ? 'Invalid email'
            : null,
        errorStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.red,
        ),
      ),
    );
  }
}
