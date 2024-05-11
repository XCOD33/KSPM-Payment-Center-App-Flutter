import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/utils/colors.dart';
import 'package:kspm_payment_center_app/utils/text_style.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Masukkan NIM",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Masukkan Password",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 32),
                      child: Column(
                        children: [
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
                              onPressed: null,
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
