import 'dart:convert';
import 'package:kspm_payment_center_app/model/login_response.dart';
import 'package:kspm_payment_center_app/services/http_service.dart';

Future login(String nim, String password) async {
  final response =
      await postRequest('users/login', {'nim': nim, 'password': password});

  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    return LoginResponse(
        success: false, message: jsonDecode(response.body)['message']);
  }
}
