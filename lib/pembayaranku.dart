import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kspm_payment_center_app/detail_pembayaran.dart';
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
  var pembayaranku = [
    {
      "title": "Pembayaran Kunjungan Industri 1",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ac nunc purus. Quisque cursus ipsum sit amet pellentesque aliquet. Integer eu posuere justo. Sed posuere tempus orci eu tristique. Nunc eget lorem a libero elementum porta. Donec euismod enim in est bibendum, ut varius orci placerat. Sed sit amet volutpat quam.",
      "price": "Rp 150.000",
      "status": "Lunas",
    },
    {
      "title": "Pembayaran Kunjungan Industri 2",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porttitor dictum elit, vel sagittis eros consequat in. Fusce vitae lectus quam. Cras posuere neque eget faucibus aliquet. Etiam dignissim libero facilisis quam euismod, ac rhoncus tortor hendrerit. Fusce ultricies, risus sit amet maximus pharetra, enim ipsum pharetra dolor, sit amet vehicula mauris mauris eget libero. Quisque rhoncus dolor sem, et commodo est ultricies eu. Morbi ac nisi aliquet, sagittis orci non, accumsan elit. Aliquam congue leo sit amet venenatis tempus. Duis sollicitudin id dui nec consectetur. Fusce laoreet nisl eros, nec condimentum nisl commodo at. In semper tempus justo at tristique. Pellentesque malesuada iaculis aliquet. In id elementum quam. Aenean vulputate magna vel egestas finibus.",
      "price": "Rp 170.000",
      "status": "Belum Lunas",
    },
    {
      "title": "Pembayaran Kunjungan Industri 3",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lacinia ligula condimentum laoreet tristique. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque pretium dui ac purus vehicula, sit amet mollis justo luctus. Fusce lorem risus, commodo eu mi in, rutrum malesuada mauris. Maecenas et dui pellentesque, pellentesque elit vel, pretium eros. Aliquam ac tortor iaculis, egestas nibh ut, finibus urna. Donec feugiat nibh sit amet velit molestie auctor. Nulla iaculis lectus libero. Ut at magna ac turpis pulvinar facilisis.",
      "price": "Rp 190.000",
      "status": "Belum Lunas",
    },
    {
      "title": "Pembayaran Kunjungan Industri 4",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin consectetur convallis nunc nec dapibus. Integer quis turpis id ex cursus posuere. Nullam sem ex, cursus in rhoncus non, vehicula et tellus. Phasellus vulputate laoreet magna, a dapibus tortor mattis a. Mauris et egestas mi. Donec vitae vulputate mauris. Nam in scelerisque neque. Cras consectetur quam ut aliquam hendrerit.",
      "price": "Rp 100.000",
      "status": "Lunas",
    },
  ];

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
              itemCount: pembayaranku.length,
              itemBuilder: (context, int index) {
                return Card(
                  color: AppColors.lavenderMist,
                  margin: EdgeInsets.only(bottom: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPembayaran(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            pembayaranku[index]['title']!,
                            style: AppTextStyle.fontRegular(14),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              child: Text(
                                pembayaranku[index]['description']!,
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
                                    pembayaranku[index]['price']!,
                                    style:
                                        AppTextStyle.fontBoldMidnightBlue(20),
                                  ),
                                  Text(
                                    pembayaranku[index]['status']! == "Lunas"
                                        ? "Lunas"
                                        : "Belum Lunas",
                                    style: AppTextStyle.font(18,
                                        color: pembayaranku[index]['status']! ==
                                                "Lunas"
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
            ),
          )
        ],
      ),
    );
  }
}
