import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Column(
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
                  "2",
                  style: AppTextStyle.fontBold(14),
                ),
              ),
              leading: Container(
                margin: EdgeInsets.all(10),
                child: Icon(Icons.abc),
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
                  "Rp 300.000",
                  style: AppTextStyle.fontBold(14),
                ),
              ),
              leading: Container(
                margin: EdgeInsets.all(10),
                child: Icon(Icons.abc),
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
                  "1",
                  style: AppTextStyle.fontBold(14),
                ),
              ),
              leading: Container(
                margin: EdgeInsets.all(10),
                child: Icon(Icons.abc),
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
                  "Rp 150.000",
                  style: AppTextStyle.fontBold(14),
                ),
              ),
              leading: Container(
                margin: EdgeInsets.all(10),
                child: Icon(Icons.abc),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
