class PaymentResponse {
  final bool success;
  final String message;
  final PaymentData data;

  PaymentResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      success: json['success'],
      message: json['message'],
      data: PaymentData.fromJson(json['data']),
    );
  }
}

class PaymentData {
  final String checkoutUrl;

  PaymentData({
    required this.checkoutUrl,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      checkoutUrl: json['checkout_url'],
    );
  }
}
