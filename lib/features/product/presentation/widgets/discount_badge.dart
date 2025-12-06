import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
class DiscountBadge extends StatelessWidget {
  final String discount;
  final Color? backgroundColor;

  const DiscountBadge({super.key, required this.discount, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal:6.w,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? appcolors.buttoncoloronboarding,
        borderRadius: BorderRadius.only(bottomRight:Radius.circular( 4.w),topLeft:Radius.circular( 4.w) ),
      ),
      child: Text(
        discount,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          color:appcolors.primarycolor,
          fontFamily: Appstring.fontfamily
        ),
      ),
    );
  }
}
