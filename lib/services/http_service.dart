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
      Uri.parse('http://192.168.1.250:8000/api/$url'),
      headers: headers,
      body: jsonEncode(body));

  return response;
}

Future getRequest(String url, String token) async {
  final response = await http.get(
    Uri.parse('http://192.168.1.250:8000/api/$url'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );

  return response;
}
