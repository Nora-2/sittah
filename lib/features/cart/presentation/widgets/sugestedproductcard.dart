
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class SuggestedProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String image;

  const SuggestedProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: appcolors.whicolor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 82.h,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child:Image.asset(Appimage.cardglass,width: 100.w,fit: BoxFit.contain,)
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: Appstring.fontfamily
                ),
              ),
             Spacer(),
              Text(
                '${price.toStringAsFixed(0)} د.ع',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: Appstring.fontfamily,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          OutlinedButton(
            onPressed: () {
             
            },
            style: OutlinedButton.styleFrom(
              side:  BorderSide(color:appcolors.buttoncoloronboarding),
              minimumSize: Size(double.infinity, 30.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r),
              ),
            ),
            child: Text(
              'اضافة',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                  fontFamily: Appstring.fontfamily,
                color: appcolors.buttoncoloronboarding,
              ),
            ),
          ),
        ],
      ),
    );
  }
}