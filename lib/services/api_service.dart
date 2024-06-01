import 'dart:convert';
import 'package:kspm_payment_center_app/model/login_response.dart';
import 'package:kspm_payment_center_app/services/http_service.dart';
import 'package:kspm_payment_center_app/services/token_service.dart';

Future login(String nim, String password) async {
  final response =
      await postRequest('users/login', {'nim': nim, 'password': password});

  if (response.statusCode == 200) {
    final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
    if (loginResponse.success && loginResponse.token != null) {
      final tokenService = TokenService();
      await tokenService.saveToken(loginResponse.token!);
    }
  } else {
    return LoginResponse(
        success: false, message: jsonDecode(response.body)['message']);
  }
}
