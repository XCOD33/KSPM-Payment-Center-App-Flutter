import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/utils/colors.dart';
import 'package:kspm_payment_center_app/utils/text_style.dart';

// void main() {
//   runApp(const Pembayaranku());
// }

class Pembayaranku extends StatefulWidget {
  const Pembayaranku({super.key});

  @override
  State<Pembayaranku> createState() => _PembayarankuState();
}

class _PembayarankuState extends State<Pembayaranku> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pembayaranku",
            style: AppTextStyle.fontBold(32),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: SizedBox(
              width: 256,
              height: 40,
              child: Text(
                "Lihat tagihan pembayaran dan detail tagihan pembayaran",
                style: AppTextStyle.fontRegular(16),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  color: AppColors.lavenderMist,
                  margin: EdgeInsets.only(bottom: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          "Pembayaran Kunjungan Industri 1",
                          style: AppTextStyle.fontRegular(14),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet consectetur. Etiam egestas ridiculus orci orci quam eu nisi. Aliquet enim diam risus rhoncus fermentum placerat. Sapien ipsum ornare ac accumsan est amet ut.",
                            style: AppTextStyle.fontRegular(12),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rp 150.000",
                                  style: AppTextStyle.fontBoldMidnightBlue(20),
                                ),
                                Text(
                                  "Lunas",
                                  style: AppTextStyle.font(18,
                                      color: AppColors.forestGreen,
                                      fw: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
