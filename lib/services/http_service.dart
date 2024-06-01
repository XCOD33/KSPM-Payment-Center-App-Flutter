import 'dart:convert';

import 'package:http/http.dart' as http;

Future postRequest(String url, Map body) async {
  final response = await http.post(
      Uri.parse('https://7f20-125-160-99-11.ngrok-free.app/api/$url'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body));

  return response;
}
