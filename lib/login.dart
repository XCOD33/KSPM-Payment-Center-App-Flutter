import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/nav.dart';
import 'package:kspm_payment_center_app/services/api_service.dart';
import 'package:kspm_payment_center_app/utils/colors.dart';
import 'package:kspm_payment_center_app/utils/text_style.dart';
import 'package:logger/logger.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _message;

  Future _login() async {
    final logger = Logger(level: Level.all);
    final nim = _nimController.text;
    final password = _passwordController.text;

    try {
      final response = await login(nim, password);
      setState(() {
        _message = response.message;
      });
      if (response.success) {
        logger.d('Token: ${response.token}');
        logger.d('Nama: ${response.nama}');
      }
    } catch (e) {
      setState(() {
        _message = 'Terjadi kesalahan: $e';
        // logging
        logger.e('Terjadi kesalahan: $e');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 83),
                child: Image.asset(
                  "assets/kspm-uty-logo.png",
                  width: 159,
                  height: 159,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 52,
                  right: 52,
                  bottom: 32,
                ),
                padding: const EdgeInsets.only(bottom: 18),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nimController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Masukkan NIM",
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Masukkan Password",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 32),
                      child: Column(
                        children: [
                          if (_message != null) ...[
                            SizedBox(
                              height: 20,
                              child: Text(
                                _message!,
                              ),
                            )
                          ],
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColors.midnightBlue),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                              // onPressed: () {
                              //   Navigator.pushAndRemoveUntil(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => const Nav()),
                              //       (route) => false);
                              // },
                              onPressed: _login,
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 245, 245, 247),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: Text(
                              "Aku lupa password",
                              style: AppTextStyle.fontBoldMidnightBlue(15),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 47),
            alignment: const Alignment(0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Butuh Bantuan?",
                  style: AppTextStyle.fontRegular(14),
                ),
                Text(
                  "Hubungi Kami",
                  style: AppTextStyle.fontRegularMidgnightBlue(14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
