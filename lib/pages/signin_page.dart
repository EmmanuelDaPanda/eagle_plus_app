import 'package:eagle_plus_app/palette.dart';
import 'package:eagle_plus_app/services/auth_service.dart';
import 'package:eagle_plus_app/widgets/google_signin.dart';
import 'package:eagle_plus_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final void Function()? onTap;
  const SignIn({super.key, required this.onTap});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // user sign in onTap function
  void signInOnTap() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // sign in code block
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException {
      Navigator.pop(context);
      // show error
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Palette.darkBrown,
            title: Center(
              child: Text(
                "Invalid credentials!",
                style: TextStyle(
                  color: Palette.white,
                ),
              ),
            ),
          );
        },
      );
    }
  }

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),

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
                    obscureText: false,
                  ),

                  const SizedBox(height: 20),

                  // password text field
                  MyTextField(
                    controller: passwordController,
                    hintText: "Enter Password",
                    obscureText: true,
                  ),

                  const SizedBox(height: 20),

                  // sign in button
                  GestureDetector(
                    onTap: signInOnTap,
                    child: Padding(
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // forgot password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: Palette.lightWhite,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // or divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Palette.lightWhite,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "or",
                            style: TextStyle(
                              color: Palette.lightWhite,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Palette.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // continue with google button
                  ContinueWithGoogle(
                    googleOnTap: () => AuthService().signInWithGoogle(),
                  ),

                  const SizedBox(height: 100),

                  // create account
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "New to Eag-le+?",
                          style: TextStyle(
                            color: Palette.white,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            "Sign up now!",
                            style: TextStyle(
                              color: Palette.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
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
