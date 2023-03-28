import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void signOutOnTap() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: signOutOnTap,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(
        child: Text("Logged in!"),
      ),
    );
  }
}
