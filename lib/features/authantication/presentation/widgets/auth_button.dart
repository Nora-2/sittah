import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final dynamic onPressed;
  final Color? backgroundColor;
  final double? height;
  final IconData? icon;
  final Color? color;
  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.height,
    this.icon,
    this.color,
    
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: appcolors.whicolor, width: 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20.w),
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
    );
  }
}
