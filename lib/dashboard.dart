import 'package:assignment_firebase/google_sign_inn.dart';
import 'package:assignment_firebase/sign_in.dart';
import 'package:assignment_firebase/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
                child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signInAnonymously();
                print(FirebaseAuth.instance.currentUser!.uid);
              },
              child: Text("Sign In Anonymous"),
            )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const LoginScreen())));
              },
              child: const Text('Sign in'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const RegistrationScreen())));
              },
              child: const Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomePage())));
              },
              child: const Text('GoogleSignIn'),
            ),
          ],
        ),
      ),
    );
  }
}
