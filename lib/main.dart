import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/login.dart';
import 'package:kspm_payment_center_app/nav.dart';
import 'package:kspm_payment_center_app/services/token_service.dart';
import 'package:kspm_payment_center_app/utils/colors.dart';
import 'package:kspm_payment_center_app/utils/text_style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.ghostWhite,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TokenService _tokenService = TokenService();

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future _checkToken() async {
    final token = await _tokenService.getToken();
    if (token != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Nav()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      });
    }
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
          Align(
            alignment: const AlignmentDirectional(0, 0.9),
            child: Text(
              "V1.x.x",
              style: AppTextStyle.fontBold(15),
            ),
          )
        ],
      ),
    );
  }
}
