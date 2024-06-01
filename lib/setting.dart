import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/login.dart';
import 'package:kspm_payment_center_app/services/token_service.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final TokenService _tokenService = TokenService();

  Future _logout() async {
    await _tokenService.clearToken();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: _logout,
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
