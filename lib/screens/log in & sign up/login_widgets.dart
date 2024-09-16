import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:smart_home/var/var.dart';
import 'package:smart_home/controllers/login_or_signup.dart';

class LoginWidget extends StatefulWidget {
  final Login_or_signup login_or_signup;
  const LoginWidget({super.key, required this.login_or_signup});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with SingleTickerProviderStateMixin {
  bool isEmailValid = false;
  bool signupTaped = false;
  String email = '';
  String ownerEmail = '';
  String username = '';
  String password = '';
  bool emptyFields = false;
  bool isOwner = true;

  late AnimationController _controller;
  // late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    // _animation = CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // );
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

  void _toggleUserType() {
    setState(() {
      isOwner = !isOwner;
      if (isOwner) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
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
              _buildWelcomeText(),
              _buildUserTypeToggle(),
              _buildLoginFields(),
              _buildForgotPassword(),
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

  Widget _buildWelcomeText() {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [mainColor1, mainColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Text(
        'Welcome',
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget _buildUserTypeToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildToggleButton('Owner', isOwner),
        const SizedBox(width: 20),
        _buildToggleButton('User', !isOwner),
      ],
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return InkWell(
      onTap: _toggleUserType,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [mainColor1, mainColor2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.transparent : mainColor1,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: isSelected ? Colors.white : mainColor1,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginFields() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isOwner
              ? _buildTextField(obscureText: false, hintText: 'Email')
              : _buildTextField(obscureText: false, hintText: 'Owner Email'),
        ),
        if (!isOwner)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _buildTextField(obscureText: false, hintText: 'Username'),
          ),
        if (isOwner)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _buildTextField(obscureText: true, hintText: 'Password'),
          ),
        // AnimatedSwitcher(
        //   duration: const Duration(milliseconds: 300),
        //   child: isOwner
        //       ? _buildTextField(obscureText: true, hintText: 'Password')
        //       : _buildTextField(obscureText: false, hintText: 'Username'),
        // ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: isOwner
              ? const SizedBox.shrink()
              : _buildTextField(obscureText: true, hintText: 'Password'),
        ),
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
        case 'Owner Email':
          email = value;
          isEmailValid = EmailValidator.validate(value);
          break;
        case 'Password':
          password = value;
          break;
        case 'Username':
          username = value;
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

  Widget _buildForgotPassword() {
    return Align(
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
            color: mainColor2,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Column(
      children: [
        InkWell(
          onTap: _handleLogin,
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
              'Login',
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
          'Don\'t have an account?',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: mainColor3.withOpacity(.7),
          ),
        ),
        InkWell(
          onTap: () {
            widget.login_or_signup.changeIsSignup(true);
          },
          child: Text(
            '  Signup',
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

  void _handleLogin() {
    setState(() {
      emptyFields = false;
    });
    if (_validateFields()) {
      _performLogin();
    } else {
      setState(() {
        emptyFields = true;
      });
    }
  }

  bool _validateFields() {
    if (isOwner) {
      return isEmailValid && password.isNotEmpty && email.isNotEmpty;
    } else {
      return isEmailValid &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          username.isNotEmpty;
    }
  }

  void _performLogin() {
    if (isOwner) {
      print('Owner login: $email, $password');
    } else {
      print('User login: $email, $username, $password');
    }
  }
}
