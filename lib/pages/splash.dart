import 'package:eagle_plus_app/pages/signin.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return const SignIn();
          },
        ),
      );
    });
    return Scaffold(
      body: Image.asset(
        "images/splash/intro2.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
      extendBody: true,
    );
  }
}
