import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/icon/signin.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.contain,
        ),
        Scaffold(
          backgroundColor: const Color.fromARGB(66, 0, 0, 0),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 200),

                  Image.asset("images/icon/logo.png", width: 150),

                  const SizedBox(height: 20),

                  const Text(
                    "Welcome back!",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),

                  const SizedBox(height: 100),

                  // email text field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "Enter E-mail",
                        hintStyle: TextStyle(color: Colors.white54),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCD9C3F)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // password text field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: TextStyle(color: Colors.white54),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCD9C3F)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFCD9C3F),
                      ),
                      child: const Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
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
                            Icon(Icons.check_box_outlined, color: Colors.white54),
                            SizedBox(width: 5),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: Colors.white54,
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
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sign up now.",
                          style: TextStyle(
                            color: Colors.white,
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
        )
      ],
    );

    // return Container(
    //   decoration: const BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage("images/icon/signin.png"),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   child: const SafeArea(
    //     child: Scaffold(
    //       backgroundColor: Colors.transparent,
    //       body: Text("some text", style: TextStyle(fontSize: 30, color: Colors.white),),
    //     ),
    //   ),
    // );
  }
}
