import 'dart:convert';

import 'package:http/http.dart' as http;

Future postRequest(String url, Map body, {String? token}) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  if (token != null) {
    headers['Authorization'] = 'Bearer $token';
  }

  final response = await http.post(
      Uri.parse('https://dev.kspmuty.com/api/$url'),
      headers: headers,
      body: jsonEncode(body));

  return response;
}

Future getRequest(String url, String token) async {
  final response = await http.get(
    Uri.parse('https://dev.kspmuty.com/api/$url'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );

  return response;
}
