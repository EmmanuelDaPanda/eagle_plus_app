import 'package:eagle_plus_app/palette.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'package:eagle_plus_app/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
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
        iconTheme: const IconThemeData(color: Palette.white),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.white,
          primary: Palette.darkBrown,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Palette.white,
          displayColor: Palette.white,
        ),
        canvasColor: Palette.darkBrown,
      ),
    );
  }
}
