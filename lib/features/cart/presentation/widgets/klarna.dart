import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';

class klarna extends StatelessWidget {
  const klarna({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '4 أقساط بدون فوائد بقيمة 5.73 د.ج مع',
            style: TextStyle(fontSize: 11.sp, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),

          SvgPicture.asset(AppIcons.klarnaLogoSvg),
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Color(0xffB2FCE4),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.vector,
                  width: 12,
                  height: 12,
                ),
                Text(
                  'afterpay',
                  style: TextStyle(
                    fontSize: 12,
                    color: appcolors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
