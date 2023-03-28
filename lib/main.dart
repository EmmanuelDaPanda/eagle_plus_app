import 'package:eagle_plus_app/pages/signin.dart';
import 'package:eagle_plus_app/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Eagle Plus",
      home: const Splash(),
      theme: ThemeData(
        primaryColor: const Color(0xFFCD9C3F),
      ),
    );
  }
}
