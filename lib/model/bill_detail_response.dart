class BillDetailResponse {
  final int id;
  final int pembayaranId;
  final int userId;
  final String invoiceId;
  final String uuid;
  final String? paymentMethod;
  final String? paymentMethodCode;
  final int totalFee;
  final int subtotal;
  final int total;
  final String status; // Status dari objek utama
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final Pembayaran pembayaran;

  BillDetailResponse({
    required this.id,
    required this.pembayaranId,
    required this.userId,
    required this.invoiceId,
    required this.uuid,
    this.paymentMethod,
    this.paymentMethodCode,
    required this.totalFee,
    required this.subtotal,
    required this.total,
    required this.status, // Inisialisasi status
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.pembayaran,
  });

  factory BillDetailResponse.fromJson(Map<String, dynamic> json) {
    return BillDetailResponse(
      id: json['id'],
      pembayaranId: json['pembayaran_id'],
      userId: json['user_id'],
      invoiceId: json['invoice_id'],
      uuid: json['uuid'],
      paymentMethod: json['payment_method'],
      paymentMethodCode: json['payment_method_code'],
      totalFee: json['total_fee'] ?? '0',
      subtotal: json['subtotal'] ?? '0',
      total: json['total'] ?? '0',
      status: json['status'], // Parsing status
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      pembayaran: Pembayaran.fromJson(json['pembayaran']),
    );
  }
}

class Pembayaran {
  final int id;
  final String uuid;
  final String url;
  final String name;
  final int nominal;
  final String description;
  final String status;
  final int createdBy;
  final String expiredAt;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  Pembayaran({
    required this.id,
    required this.uuid,
    required this.url,
    required this.name,
    required this.nominal,
    required this.description,
    required this.status,
    required this.createdBy,
    required this.expiredAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Pembayaran.fromJson(Map<String, dynamic> json) {
    return Pembayaran(
      id: json['id'],
      uuid: json['uuid'],
      url: json['url'],
      name: json['name'],
      nominal: json['nominal'],
      description: json['description'],
      status: json['status'],
      createdBy: json['created_by'],
      expiredAt: json['expired_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}
