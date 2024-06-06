import 'dart:convert';
import 'package:kspm_payment_center_app/model/bill_detail_response.dart';
import 'package:kspm_payment_center_app/model/bill_response.dart';
import 'package:kspm_payment_center_app/model/channel_response.dart';
import 'package:kspm_payment_center_app/model/login_response.dart';
import 'package:kspm_payment_center_app/model/user_detail_response.dart';
import 'package:kspm_payment_center_app/services/http_service.dart';
import 'package:kspm_payment_center_app/services/token_service.dart';
import 'package:kspm_payment_center_app/model/payment_response.dart';

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

Future<List<BillDetailResponse>> fetchBillDetails() async {
  final tokenService = TokenService();
  final token = await tokenService.getToken();

  try {
    final response = await getRequest('pembayaranku/bills', token);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => BillDetailResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load bill details');
    }
  } catch (e) {
    print("exception: $e");
    throw Exception('Failed to load bill details: $e');
  }
}

Future<List<Channel>> fetchChannels(String url) async {
  final tokenService = TokenService();
  final token = await tokenService.getToken();

  final response = await getRequest("pembayaranku/bills/$url", token);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body)['data'];
    final pembayaranUser = data['pembayaran_user'];
    final List<dynamic> channelsJson = data['channels'];

    if (pembayaranUser['status'] != 'PAID') {
      return channelsJson.map((json) => Channel.fromJson(json)).toList();
    } else {
      return [];
    }
  } else {
    throw Exception('Failed to load channels');
  }
}

Future<PaymentResponse> processPayment(String url, String paymentCode) async {
  final tokenService = TokenService();
  final token = await tokenService.getToken();

  final response = await postRequest(
      'pembayaranku/bills/$url/pay', {'payment_code': paymentCode},
      token: token);

  if (response.statusCode == 200) {
    return PaymentResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to process payment');
  }
}

Future<UserDetail> fetchUserDetails() async {
  final tokenService = TokenService();
  final token = await tokenService.getToken();

  final response = await getRequest('users/detail', token);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body)['data'];
    return UserDetail.fromJson(data);
  } else {
    throw Exception('Failed to load user details');
  }
}
