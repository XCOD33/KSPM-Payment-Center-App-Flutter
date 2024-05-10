import 'package:flutter/material.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                        child: const Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 41, 20, 112)),
                                ),
                                onPressed: null,
                                child: Text(
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
                              padding: EdgeInsets.only(top: 18),
                              child: Text(
                                "Aku lupa password",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 41, 20, 112),
                                  fontSize: 14,
                                ),
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Butuh Bantuan?"),
                  Text(
                    "Hubungi Kami",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 41, 20, 112),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
