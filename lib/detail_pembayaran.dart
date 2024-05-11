import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/utils/colors.dart';
import 'package:kspm_payment_center_app/utils/text_style.dart';

// void main() {
//   runApp(const DetailPembayaran());
// }

class DetailPembayaran extends StatefulWidget {
  const DetailPembayaran({super.key});

  @override
  State<DetailPembayaran> createState() => _DetailPembayaranState();
}

class _DetailPembayaranState extends State<DetailPembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 47,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: AppColors.lavenderMist,
                  margin: EdgeInsets.only(bottom: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Text("Pembayaranku"),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            "Testing",
                            style: AppTextStyle.fontRegular(14),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              child: Text(
                                "Test Description",
                                style: AppTextStyle.fontRegular(12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rp 10.000",
                                    style:
                                        AppTextStyle.fontBoldMidnightBlue(20),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Opsi Pembayaran",
                    style: AppTextStyle.font(
                      18,
                      fw: FontWeight.w700,
                      color: AppColors.jetBlack,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        color: AppColors.lavenderMist,
                        margin: EdgeInsets.only(bottom: index == 9 ? 100 : 15),
                        child: ListTile(
                          title: Text(
                            "Rp 150.000",
                            style: AppTextStyle.font(
                              10,
                              fw: FontWeight.bold,
                              color: AppColors.jetBlack,
                            ),
                          ),
                          subtitle: Text(
                            "adm. fee : Rp 4.500",
                            style: AppTextStyle.font(
                              9,
                              fw: FontWeight.normal,
                              color: AppColors.burningOrange,
                            ),
                          ),
                          leading: Icon(Icons.access_alarm_sharp),
                          trailing: Radio(
                            value: null,
                            groupValue: null,
                            onChanged: null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment(0, 0.95),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.midnightBlue),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    onPressed: null,
                    child: Text(
                      "Bayar Tagihan",
                      style: AppTextStyle.font(16,
                          fw: FontWeight.bold, color: AppColors.ghostWhite),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
