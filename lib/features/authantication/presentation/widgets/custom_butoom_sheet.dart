import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class PasswordSuccessDialog extends StatelessWidget {
  const PasswordSuccessDialog({
    super.key,
    required this.text,
    required this.onPressed,
    required this.dialogSubtitle,
    required this.dialogTitle,

    required this.button,
  });

  final VoidCallback onPressed;
  final String text;

  final String dialogTitle;
  final String dialogSubtitle;
  final Widget button;

  static Future<void> show({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    required String dialogTitle,
    required String dialogSubtitle,

    required Widget button
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PasswordSuccessDialog(
        text: text,
        onPressed: onPressed,
        dialogTitle: dialogTitle,
        dialogSubtitle: dialogSubtitle,
        
        button: button,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: appcolors.transcolor,
      insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: appcolors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                color: appcolors.green,
                size: 40.sp,
              ),
            ),

            SizedBox(height: 24.h),

            // Title
            Text(
              dialogTitle,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: appcolors.black,
                fontFamily: Appstring.fontfamily,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 12.h),

            // Subtitle
            Text(
              dialogSubtitle,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: Appstring.fontfamily,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 32.h),

            // Button
            button,
          ],
        ),
      ),
    );
  }
}
