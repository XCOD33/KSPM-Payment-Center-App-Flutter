class LoginResponse {
  final bool success;
  final String message;
  final String? token;
  final String? nama;

  LoginResponse(
      {required this.success, required this.message, this.token, this.nama});

  factory LoginResponse.fromJson(Map json) {
    return LoginResponse(
        success: json['success'] ?? false,
        message: json['message'] ?? '',
        token: json['data'] != null ? json['data']['token'] : null,
        nama: json['data'] != null ? json['data']['nama'] : null);
  }
}
