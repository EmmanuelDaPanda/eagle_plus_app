import 'package:eagle_plus_app/pages/signin_page.dart';
import 'package:eagle_plus_app/pages/signup_page.dart';
import 'package:flutter/material.dart';

class SignInOrSignUp extends StatefulWidget {
  const SignInOrSignUp({super.key});

  @override
  State<SignInOrSignUp> createState() => _SignInOrSignUpState();
}

class _SignInOrSignUpState extends State<SignInOrSignUp> {

  // initially show signin page
  bool showSignInPage = true;

  // toggle between signin and signup
  void togglePages() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignIn(onTap: togglePages);
    } else {
      return SignUp(onTap: togglePages);
    }
  }
}