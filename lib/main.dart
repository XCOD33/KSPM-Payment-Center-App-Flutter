import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/kspm-uty-logo.png",
              width: 159,
              height: 159,
            ),
          ),
          const Align(
            alignment: AlignmentDirectional(0, 0.9),
            child: Text(
              "V1.x.x",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
