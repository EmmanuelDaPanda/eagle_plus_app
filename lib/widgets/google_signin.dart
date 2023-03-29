import 'package:eagle_plus_app/palette.dart';
import 'package:flutter/material.dart';

class ContinueWithGoogle extends StatelessWidget {
  final Function()? googleOnTap;
  const ContinueWithGoogle({
    super.key,
    required this.googleOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: googleOnTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Palette.gold,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/icon/Google.png",
                height: 25,
              ),
              const SizedBox(width: 10),
              const Text(
                "Continue with Google",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Palette.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
