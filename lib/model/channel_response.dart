class Channel {
  final String code;
  final String name;
  final int totalFee;
  final String iconUrl;
  final num total;

  Channel({
    required this.code,
    required this.name,
    required this.totalFee,
    required this.iconUrl,
    required this.total,
  });

  factory Channel.fromJson(Map json) {
    return Channel(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      totalFee: json['total_fee']['flat'] ?? 0,
      iconUrl: json['icon_url'] ?? '',
      total: json['total'] ?? 0,
    );
  }
}
