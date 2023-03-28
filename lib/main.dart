import 'package:eagle_plus_app/palette.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:eagle_plus_app/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.white,
          primary: Palette.gold,
        ),
      ),
    );
  }
}
