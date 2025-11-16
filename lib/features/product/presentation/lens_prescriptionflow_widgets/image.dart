import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
class lensimage extends StatelessWidget {
  const lensimage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            SizedBox(height: 10.h),
          Image.asset('assets/images/lems2.png',width: 300.w,height: 200.h,fit: BoxFit.fill,),
            SizedBox(height: 10.h),
          Text('ارفع صورة الوصفة الطبية', style: TextStyle(
                      color: appcolors.black,
                      fontSize: 16.sp,
                      fontFamily: Appstring.fontfamily,
                      fontWeight: FontWeight.w600
                    ),),
            SizedBox(height: 10.h),
          Text(
            'خلينا نجهز نظارتك بالمقاس والدقة المناسبة لعينيك', style: TextStyle(
                      color: appcolors.graylinethrough,
                      fontSize: 12.sp,
                      fontFamily: Appstring.fontfamily,
                    ),
          ),
            SizedBox(height: 10.h),
    GestureDetector(
          onTap: (){},
          child: Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: appcolors.whicolor,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: appcolors.black, width: 1),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/camera.svg'),
                  SizedBox(width: 7.w),
                  Text(
                  'صور الوصفة',
                    style: TextStyle(
                      color: appcolors.black,
                      fontSize: 14.sp,
                      fontFamily: Appstring.fontfamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        ],
      );
  }
}
