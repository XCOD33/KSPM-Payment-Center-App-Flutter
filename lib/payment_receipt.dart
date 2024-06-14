import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:kspm_payment_center_app/utils/format_num.dart';
import 'package:kspm_payment_center_app/utils/colors.dart';
import 'package:kspm_payment_center_app/utils/text_style.dart';

class PaymentReceipt extends StatelessWidget {
  final String name;
  final String description;
  final int nominal;
  final String status;
  final String receiptUrl;

  const PaymentReceipt({
    super.key,
    required this.name,
    required this.description,
    required this.nominal,
    required this.status,
    required this.receiptUrl,
  });

  void _shareReceipt(BuildContext context) {
    final String receiptText =
        'Bukti Pembayaran:\n\nNama: $name\nDeskripsi: $description\nNominal: ${formatCurrency(nominal)}\nStatus: $status\n\nLihat bukti pembayaran: $receiptUrl';
    Share.share(receiptText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bukti Pembayaran'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareReceipt(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: AppColors.forestGreen,
                size: 100,
              ),
              const SizedBox(height: 20),
              Text(
                "Pembayaran Anda telah Lunas!",
                style: AppTextStyle.font(24,
                    fw: FontWeight.bold, color: AppColors.jetBlack),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Nama: $name\n'
                'Deskripsi: $description\n'
                'Nominal: ${formatCurrency(nominal)}\n'
                'Status: $status',
                style: AppTextStyle.font(16, color: AppColors.jetBlack),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.share),
                label: const Text("Bagikan Bukti Pembayaran"),
                onPressed: () => _shareReceipt(context),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.midnightBlue),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                  textStyle: MaterialStateProperty.all(AppTextStyle.font(16,
                      fw: FontWeight.bold,
                      color: const Color.fromARGB(255, 245, 245, 247))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
