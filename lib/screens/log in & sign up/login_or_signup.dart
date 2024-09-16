import 'package:flutter/material.dart';
import 'package:smart_home/controllers/login_or_signup.dart';
import 'package:smart_home/screens/log%20in%20&%20sign%20up/background_animathion_test.dart';
import 'package:smart_home/screens/log%20in%20&%20sign%20up/login_widgets.dart';
import 'package:smart_home/screens/log%20in%20&%20sign%20up/signup_widget.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> with SingleTickerProviderStateMixin {

  final Login_or_signup login_or_signup = Login_or_signup();

  @override
  void initState() {
    super.initState();
    login_or_signup.addListener(() {
      setState(() {
        print('signupTaped 1 ');
        
        print(login_or_signup.signupTaped);
      });
    });
  }

  @override
  void dispose() {
    login_or_signup.dispose();
    super.dispose();
  }
 
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Animathon_background(),
            Center(
              child: login_or_signup.signupTaped
                  ? SignupWidget(login_or_signup: login_or_signup)
                  : LoginWidget(login_or_signup: login_or_signup),
            ),
          ],
        ),
      ),
    );
  }



}
