import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

// ignore: must_be_immutable
class Custombutton extends StatelessWidget {
  final String text;
  final dynamic onPressed;
  Color? backgroundColor = appcolors.buttoncoloronboarding;
  final double? height;
  final String icon;
  Color? color = appcolors.primarycolor;
  Custombutton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.height,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: backgroundColor!, width: 1),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              SizedBox(width: 7.w),
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 14.sp,
                  fontFamily: Appstring.fontfamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
