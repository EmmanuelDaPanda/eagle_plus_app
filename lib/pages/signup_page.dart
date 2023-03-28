import 'package:eagle_plus_app/palette.dart';
import 'package:eagle_plus_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  final void Function()? onTap;
  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // user sign up onTap function
  void signUpOnTap() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // sign up code block
    try {
      // check if passwords match
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      } else {
        showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Palette.darkBrown,
            title: Center(
              child: Text(
                "Passwords don't match!",
                style: TextStyle(
                  color: Palette.white,
                ),
              ),
            ),
          );
        },
      );
      }
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

  // continue with Google onTap function
  void googleOnTap() {}

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
                    "Create an account!",
                    style: TextStyle(fontSize: 20, color: Palette.white),
                  ),

                  const SizedBox(height: 70),

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

                  // confirm password text field
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    obscureText: true,
                  ),

                  const SizedBox(height: 20),

                  // sign up button
                  GestureDetector(
                    onTap: signUpOnTap,
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
                          "Sign Up",
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
                  GestureDetector(
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
                  ),

                  const SizedBox(height: 70),

                  // already have account?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
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
                            "Sign in!",
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
