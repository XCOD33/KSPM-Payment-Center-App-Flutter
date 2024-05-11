import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kspm_payment_center_app/utils/colors.dart';

class AppTextStyle {
  static TextStyle fontBold(double size) {
    return TextStyle(
      fontFamily: "Montserrat",
      fontWeight: FontWeight.bold,
      fontSize: size,
      color: AppColors.midnightBlue,
    );
  }

  static TextStyle font(double size,
      {FontWeight fw = FontWeight.bold,
      Color color = const Color.fromARGB(255, 41, 20, 112)}) {
    return TextStyle(
      fontFamily: "Montserrat",
      fontWeight: fw,
      fontSize: size,
      color: color,
    );
  }

  static TextStyle fontBoldMidnightBlue(double size) {
    return TextStyle(
      fontFamily: "Montserrat",
      fontWeight: FontWeight.bold,
      fontSize: size,
      color: AppColors.midnightBlue,
    );
  }

  static TextStyle fontRegular(double size) {
    return TextStyle(
      fontFamily: "Montserrat",
      fontSize: size,
      color: AppColors.jetBlack,
    );
  }

  static TextStyle fontRegularMidgnightBlue(double size) {
    return TextStyle(
      fontFamily: "Montserrat",
      fontSize: size,
      color: AppColors.midnightBlue,
    );
  }

  static TextStyle fontRegularForestGreen(double size) {
    return TextStyle(
      fontFamily: "Montserrat",
      fontSize: size,
      color: AppColors.forestGreen,
    );
  }
}
