import 'package:firebase_auth_demo/homescreen.dart';
import 'package:firebase_auth_demo/signinpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(GoogleSignIns());
}

class GoogleSignIns extends StatefulWidget {
  const GoogleSignIns({Key? key}) : super(key: key);
  @override
  _GoogleSignInsState createState() => _GoogleSignInsState();
}

class _GoogleSignInsState extends State<GoogleSignIns> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? SignInScreen()
          : HomeScreen(),
    );
  }
}
