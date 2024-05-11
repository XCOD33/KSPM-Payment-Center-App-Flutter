import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/utils/colors.dart';

class AppTextStyle {
  static TextStyle fontBold(double size) {
    return TextStyle(
      fontFamily: "Montserrat",
      fontWeight: FontWeight.bold,
      fontSize: size,
      color: AppColors.jetBlack,
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
}
