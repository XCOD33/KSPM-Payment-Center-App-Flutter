import 'dart:convert';

import 'package:http/http.dart' as http;

Future postRequest(String url, Map body) async {
  final response =
      await http.post(Uri.parse('https://kspm.loophole.site/api/$url'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));

  return response;
}
