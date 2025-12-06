import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import '../../data/models/coupon_model.dart';

class CouponCard extends StatelessWidget {
  final CouponModel coupon;

  const CouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 100.h,
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.only(
            top: 16.w,
            bottom: 16.w,
            left: 2.w,
            right: 2.w,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Appimage.offer),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        Positioned(
          top: 0,
          right: 8.w,
          bottom: 0,
          child: Image.asset(
            Appimage.select,
            width: 250.w,
            height: 100.h,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          
          right: 85.w, 
          top: 0,
          bottom: 0,  
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    coupon.title,
                      textAlign: TextAlign.right,
                    style: TextStyle(
                    
                      color: Colors.black,
                      fontSize: 14.sp,
                   
                     fontFamily: Appstring.fontfamily,
                      
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    textDirection: TextDirection.rtl,
                    coupon.description,
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp, fontFamily: Appstring.fontfamily,),
                  ),
                ],
              ),
                 SizedBox(width: 8.h),
              Container(
                width: 70.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: appcolors.buttoncoloronboarding,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Center(
                  child: Text(
                    'تسوق الان',
                    style: TextStyle(
                      color: appcolors.primarycolor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
