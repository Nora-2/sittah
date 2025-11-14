import 'package:flutter/material.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/screenutils.dart';

class AppTextStyles {
  static TextStyle get heading => TextStyle(
    fontSize: ScreenUtils.setFontSize(18),
    fontWeight: FontWeight.w600,
    color: appcolors.textPrimary,
  );

  static TextStyle get subheading => TextStyle(
    fontSize: ScreenUtils.setFontSize(16),
    fontWeight: FontWeight.w500,
    color: appcolors.textPrimary,
  );

  static TextStyle get body => TextStyle(
    fontSize: ScreenUtils.setFontSize(14),
    fontWeight: FontWeight.w400,
    color: appcolors.textSecondary,
  );

  static TextStyle get caption => TextStyle(
    fontSize: ScreenUtils.setFontSize(12),
    fontWeight: FontWeight.w400,
    color: appcolors.textSecondary,
  );

  static TextStyle get price => TextStyle(
    fontSize: ScreenUtils.setFontSize(16),
    fontWeight: FontWeight.w600,
    color: appcolors.textPrimary,
  );

  static TextStyle get button => TextStyle(
    fontSize: ScreenUtils.setFontSize(16),
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
