import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/detail_pembayaran.dart';
import 'package:kspm_payment_center_app/model/bill_detail_response.dart';
import 'package:kspm_payment_center_app/services/api_service.dart';
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
  late Future<List<BillDetailResponse>> futureBillDetails;

  @override
  void initState() {
    super.initState();
    futureBillDetails = fetchBillDetails();
  }

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
            child: FutureBuilder<List<BillDetailResponse>>(
              future: futureBillDetails,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Terjadi kesalahan: ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<BillDetailResponse>? billDetails = snapshot.data!;
                  return ListView.builder(
                    itemCount: billDetails.length,
                    itemBuilder: (context, index) {
                      final billDetail = billDetails[index];
                      return Card(
                        color: AppColors.lavenderMist,
                        margin: EdgeInsets.only(bottom: 15),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPembayaran(
                                  url: billDetail.pembayaran.url,
                                  name: billDetail.pembayaran.name,
                                  description: billDetail.pembayaran.name,
                                  nominal: billDetail.pembayaran.nominal,
                                  status: billDetail.status,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: ListTile(
                              title: Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text(
                                  billDetail.pembayaran.name,
                                  style: AppTextStyle.fontRegular(14),
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: Text(
                                      billDetail.pembayaran.description,
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
                                          'Rp ${billDetail.pembayaran.nominal}',
                                          style:
                                              AppTextStyle.fontBoldMidnightBlue(
                                                  20),
                                        ),
                                        Text(
                                          billDetail.status,
                                          style: AppTextStyle.font(18,
                                              color: billDetail.status == 'PAID'
                                                  ? AppColors.forestGreen
                                                  : AppColors.burningOrange,
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
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("Tidak ada data"),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
