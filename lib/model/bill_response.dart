class BillResponse {
  final bool success;
  final String message;
  final BillsData? data;

  BillResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory BillResponse.fromJson(Map json) {
    return BillResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? BillsData.fromJson(json['data']) : null,
    );
  }
}

class BillsData {
  final int myBills;
  final String totalMyBills;
  final int paidBills;
  final String totalPaidBills;

  BillsData({
    required this.myBills,
    required this.totalMyBills,
    required this.paidBills,
    required this.totalPaidBills,
  });

  factory BillsData.fromJson(Map json) {
    return BillsData(
      myBills: json['myBills'] ?? 0,
      totalMyBills: json['totalMyBills'] ?? '0',
      paidBills: json['paidBills'] ?? 0,
      totalPaidBills: json['totalPaidBills'] ?? '0',
    );
  }
}
