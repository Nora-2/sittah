import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class Passback extends StatelessWidget {
  const Passback({super.key, required this.title, required this.subTitel});
  final String title;
  final String subTitel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [appcolors.gradientauth1, appcolors.gradientauth2],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, size: 15.sp),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 4.w),
                Text(
                  Appstring.back,
                  style: TextStyle(
                    fontFamily: Appstring.fontfamily,
                    fontSize: 17.sp,
                    color: appcolors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: appcolors.black,

                        fontFamily: Appstring.fontfamily,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  subTitel,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],

                    fontFamily: Appstring.fontfamily,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
