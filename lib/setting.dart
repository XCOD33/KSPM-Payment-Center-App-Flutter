import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/login.dart';
import 'package:kspm_payment_center_app/model/user_detail_response.dart';
import 'package:kspm_payment_center_app/services/api_service.dart';
import 'package:kspm_payment_center_app/services/token_service.dart';
import 'package:kspm_payment_center_app/utils/colors.dart';
import 'package:kspm_payment_center_app/utils/text_style.dart';
import 'package:kspm_payment_center_app/utils/toast.dart';

final Map<String, String> userDetails = {
  'name': 'John Doe',
  'email': 'john.doe@example.com',
  'phone': '+1234567890',
  'member_id': '12345',
  'nim': '67890',
  'roles': 'Member',
  'position': 'Student',
};

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final TokenService _tokenService = TokenService();
  late Future<UserDetail> userDetail;

  @override
  void initState() {
    super.initState();
    userDetail = fetchUserDetails();
  }

  Future _logout() async {
    await _tokenService.clearToken();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.fontBold(16),
          ),
          Flexible(
            child: Text(
              value,
              style: AppTextStyle.fontRegular(16),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            ToastUtil.showFailedToast("Terjadi kesalahan: ${snapshot.error}");
            return Center(child: Text("Terjadi kesalahan: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile",
                    style: AppTextStyle.fontBold(32),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                      width: 256,
                      height: 40,
                      child: Text(
                        "Lihat informasi profil pengguna",
                        style: AppTextStyle.fontRegular(16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailItem("Name", snapshot.data!.name),
                        _buildDetailItem("Email", snapshot.data!.email),
                        _buildDetailItem("Phone", snapshot.data!.phone),
                        _buildDetailItem("Member ID", snapshot.data!.memberId),
                        _buildDetailItem("NIM", snapshot.data!.nim),
                        _buildDetailItem(
                            "Roles", snapshot.data!.roles.join(", ")),
                        _buildDetailItem("position", snapshot.data!.position),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.midnightBlue),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      onPressed: () {
                        _logout();
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromARGB(255, 245, 245, 247),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text("Tidak ada data"));
          }
        });
  }
}
