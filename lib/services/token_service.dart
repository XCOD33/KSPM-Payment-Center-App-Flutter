import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const String _tokenKey = 'auth_token';
  static const String _namaKey = 'user_name';

  Future saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future saveNama(String nama) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_namaKey, nama);
  }

  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future getNama() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_namaKey);
  }

  Future clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_namaKey);
  }
}
