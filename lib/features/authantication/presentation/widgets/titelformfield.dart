import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

// ignore: must_be_immutable
class Textheaderformfiled extends StatelessWidget {
  Textheaderformfiled({super.key, required this.titel});
  String titel;
  @override
  Widget build(BuildContext context) {
    return Text(
      titel,
      style: TextStyle(
        fontFamily: Appstring.fontfamily,
        color: appcolors.black2,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
    );
  }
}
