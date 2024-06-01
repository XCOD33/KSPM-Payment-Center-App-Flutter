import 'dart:convert';
import 'package:kspm_payment_center_app/model/bill_response.dart';
import 'package:kspm_payment_center_app/model/login_response.dart';
import 'package:kspm_payment_center_app/services/http_service.dart';
import 'package:kspm_payment_center_app/services/token_service.dart';

Future login(String nim, String password) async {
  try {
    final response =
        await postRequest('users/login', {'nim': nim, 'password': password});

    if (response.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if (loginResponse.success && loginResponse.token != null) {
        final tokenService = TokenService();
        await tokenService.saveToken(loginResponse.token!);
      }
      return loginResponse;
    } else {
      return LoginResponse(
          success: false,
          message: jsonDecode(response.body)['message'] ?? 'Unknown error');
    }
  } catch (e) {
    return LoginResponse(success: false, message: 'Terjadi kesalahan: $e');
  }
}

Future fetchBills() async {
  final tokenService = TokenService();
  final token = await tokenService.getToken();

  try {
    final response = await getRequest('pembayaranku/simple', token);
    if (response.statusCode == 200) {
      return BillResponse.fromJson(jsonDecode(response.body));
    } else {
      return BillResponse(
          success: false,
          message: jsonDecode(response.body)['message'] ?? 'Unknown error');
    }
  } catch (e) {
    return BillResponse(success: false, message: 'Failed to fetch bills: $e');
  }
}
