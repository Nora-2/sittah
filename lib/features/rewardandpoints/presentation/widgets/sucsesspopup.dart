
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class SuccessPopup extends StatelessWidget {
  const SuccessPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      insetPadding: EdgeInsets.all(20.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: AssetImage(Appimage.rewardsucsess),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20.h),
                Text(
                  "تم تسجيل الدخول بنجاح",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "+1",
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "لقد قمت بتسجيل الدخول لمدة \nيومين متتاليين",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16.sp,fontFamily: Appstring.fontfamily),
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appcolors.buttoncoloronboarding,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                    child: Text(
                      "متابعة",
                      style: TextStyle(color: appcolors.primarycolor, fontSize: 14.sp,fontFamily: Appstring.fontfamily),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -75.h,
            
            left: (MediaQuery.of(context).size.width / 2)- 100.w ,
            child: Image.asset(
             Appimage.coine,
              width: 150.w,
              height: 150.w,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
