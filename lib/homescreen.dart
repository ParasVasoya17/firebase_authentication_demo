import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_demo/signinpage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "Hello ${FirebaseAuth.instance.currentUser?.displayName!.toString()}"),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  await GoogleSignIn().signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue[200]),
                  height: 50,
                  width: 100,
                  child: const Center(child: Text("Signout")),
                ))
          ],
        ),
      ),
    );
  }
}
