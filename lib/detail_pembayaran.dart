import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/model/channel_response.dart';
import 'package:kspm_payment_center_app/services/api_service.dart';
import 'package:kspm_payment_center_app/utils/colors.dart';
import 'package:kspm_payment_center_app/utils/text_style.dart';
import 'package:webview_flutter/webview_flutter.dart';

// void main() {
//   runApp(const DetailPembayaran());
// }

class DetailPembayaran extends StatefulWidget {
  final String url;
  final String name;
  final String description;
  final int nominal;
  final String status;

  const DetailPembayaran({
    super.key,
    required this.url,
    required this.name,
    required this.description,
    required this.nominal,
    required this.status,
  });

  @override
  State<DetailPembayaran> createState() => _DetailPembayaranState();
}

class _DetailPembayaranState extends State<DetailPembayaran> {
  late Future<List<dynamic>> futureChannels;
  String? selectedPaymentCode;

  @override
  void initState() {
    super.initState();
    futureChannels = fetchChannels(widget.url);
  }

  Future<void> handlePayment() async {
    if (selectedPaymentCode != null) {
      try {
        final paymentResponse =
            await processPayment(widget.url, selectedPaymentCode!);

        print(paymentResponse.data.checkoutUrl);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text('Pembayaran'),
                    ),
                    body: WebViewWidget(
                      controller: WebViewController()
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..loadRequest(
                          Uri.parse(paymentResponse.data.checkoutUrl),
                        ),
                    ),
                  )),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terjadi kesalahan: $e'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pilih opsi pembayaran terlebih dahulu'),
        ),
      );
    }
  }

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
                            widget.name,
                            style: AppTextStyle.fontRegular(14),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              child: Text(
                                widget.description,
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
                                    "Rp ${widget.nominal}",
                                    style:
                                        AppTextStyle.fontBoldMidnightBlue(20),
                                  ),
                                  Text(
                                    widget.status == 'active'
                                        ? 'Lunas'
                                        : 'Belum Lunas',
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
                  child: FutureBuilder<List<Channel>>(
                    future: futureChannels as Future<List<Channel>>?,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Terjadi Kesalahan : ${snapshot.error}'),
                        );
                      } else if (snapshot.hasData) {
                        final channels = snapshot.data!;
                        if (channels.isEmpty) {
                          return Center(
                            child: Text('Tidak ada opsi pembayaran'),
                          );
                        }
                        return ListView.builder(
                          itemCount: channels.length,
                          itemBuilder: (context, index) {
                            final channel = channels[index];
                            return Card(
                              color: AppColors.lavenderMist,
                              margin: EdgeInsets.only(
                                  bottom:
                                      index == channels.length - 1 ? 100 : 15),
                              child: ListTile(
                                title: Text(
                                  "Rp ${channel.total.toString()}",
                                  style: AppTextStyle.font(
                                    10,
                                    fw: FontWeight.bold,
                                    color: AppColors.jetBlack,
                                  ),
                                ),
                                subtitle: Text(
                                  "adm. fee : Rp ${channel.totalFee}",
                                  style: AppTextStyle.font(
                                    9,
                                    fw: FontWeight.normal,
                                    color: AppColors.burningOrange,
                                  ),
                                ),
                                leading:
                                    Image.network(channel.iconUrl, width: 50),
                                trailing: Radio(
                                  value: channel.code,
                                  groupValue: selectedPaymentCode,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedPaymentCode = value as String;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Text('Tidak ada data'),
                        );
                      }
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
                    onPressed: handlePayment,
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
