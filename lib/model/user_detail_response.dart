class UserDetail {
  final String name;
  final String email;
  final String phone;
  final String memberId;
  final String nim;
  final List<String> roles;
  final String position;

  UserDetail({
    required this.name,
    required this.email,
    required this.phone,
    required this.memberId,
    required this.nim,
    required this.roles,
    required this.position,
  });

  factory UserDetail.fromJson(json) {
    return UserDetail(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      memberId: json['member_id'],
      nim: json['nim'],
      roles: List<String>.from(json['roles'].map((role) => role['name'])),
      position: json['position']['name'],
    );
  }
}
