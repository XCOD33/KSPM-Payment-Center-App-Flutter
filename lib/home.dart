import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/login.dart';
import 'package:kspm_payment_center_app/services/api_service.dart';
import 'package:kspm_payment_center_app/utils/colors.dart';
import 'package:kspm_payment_center_app/utils/text_style.dart';

// void main() {
//   runApp(const Home());
// }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  late Future _futureBills;

  @override
  void initState() {
    super.initState();
    _futureBills = fetchBills();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: FutureBuilder(
        future: _futureBills,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Terjadi kesalahan: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.success) {
            final data = snapshot.data!.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: AppTextStyle.fontBold(32),
                ),
                SizedBox(
                  width: 170,
                  height: 83,
                  child: Text(
                    "Lihat rekap tagihan pembayaran",
                    style: AppTextStyle.fontRegular(16),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(bottom: 28),
                  color: AppColors.lavenderMist,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 31),
                      child: Text(
                        "Tagihanku",
                        style: AppTextStyle.fontRegular(14),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        data.myBills.toString(),
                        style: AppTextStyle.fontBold(14),
                      ),
                    ),
                    leading: Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(Icons.payment),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(bottom: 28),
                  color: AppColors.lavenderMist,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 31),
                      child: Text(
                        "Total Tagihanku",
                        style: AppTextStyle.fontRegular(14),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        data.totalMyBills,
                        style: AppTextStyle.fontBold(14),
                      ),
                    ),
                    leading: Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(Icons.monetization_on),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(bottom: 28),
                  color: AppColors.lavenderMist,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 31),
                      child: Text(
                        "Tagihan Dibayarkan",
                        style: AppTextStyle.fontRegular(14),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        data.paidBills.toString(),
                        style: AppTextStyle.fontBold(14),
                      ),
                    ),
                    leading: Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(Icons.done),
                    ),
                  ),
                ),
                Card(
                  color: AppColors.lavenderMist,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 31),
                      child: Text(
                        "Total Tagihan Dibayarkan",
                        style: AppTextStyle.fontRegular(14),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        data.totalPaidBills,
                        style: AppTextStyle.fontBold(14),
                      ),
                    ),
                    leading: Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(Icons.done_all),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: Text("Login Lagi")),
            );
          }
        },
      ),
    );
  }
}
