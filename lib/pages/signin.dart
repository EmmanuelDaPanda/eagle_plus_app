import 'package:eagle_plus_app/palette.dart';
import 'package:eagle_plus_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/icon/signin.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 200),

                  Image.asset("images/icon/logo.png", width: 150),

                  const SizedBox(height: 20),

                  const Text(
                    "Welcome back!",
                    style: TextStyle(fontSize: 25, color: Palette.white),
                  ),

                  const SizedBox(height: 100),

                  // email text field
                  MyTextField(
                      controller: emailController,
                      hintText: "Enter E-mail",
                      obscureText: false),

                  const SizedBox(height: 20),

                  // password text field
                  MyTextField(
                      controller: passwordController,
                      hintText: "Enter Password",
                      obscureText: true),

                  const SizedBox(height: 20),

                  // sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Palette.gold,
                      ),
                      child: const Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Palette.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // forgot password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.check_box_outlined,
                                color: Palette.lightWhite),
                            SizedBox(width: 5),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                color: Palette.lightWhite,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: Palette.lightWhite,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),

                  // create account
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "New to Eag-le+?",
                          style: TextStyle(
                            color: Palette.white,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sign up now.",
                          style: TextStyle(
                            color: Palette.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
