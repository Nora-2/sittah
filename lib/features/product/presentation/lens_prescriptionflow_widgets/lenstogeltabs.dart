import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class lensTabs extends StatelessWidget {
  final bool isimage;
  final VoidCallback onTapimage;
  final VoidCallback onTapmanual;

  const lensTabs({
    super.key,
    required this.isimage,
    required this.onTapimage,
    required this.onTapmanual,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: appcolors.whicolor, // background for inactive tabs
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          width: 1,
          color: appcolors.grayviewall.withOpacity(.3),
        ),
      ),
      child: Row(
        children: [
          // Login Tab
          Expanded(
            child: GestureDetector(
              onTap: onTapimage,
              child: Container(
                decoration: BoxDecoration(
                  color: isimage
                      ? appcolors.buttoncoloronboarding.withOpacity(.82)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //change the icon
                    SvgPicture.asset(
                     AppIcons.camera,
                      color: isimage ? appcolors.whicolor : appcolors.black2,
                    ),

                    SizedBox(width: 8.w),
                    Text(
                      'ارفعها ك صورة',
                      style: TextStyle(
                        color: isimage ? appcolors.whicolor : appcolors.black2,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: Appstring.fontfamily,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Signup Tab
          Expanded(
            child: GestureDetector(
              onTap: onTapmanual,
              child: Container(
                decoration: BoxDecoration(
                  color: !isimage
                      ? appcolors.buttoncoloronboarding.withOpacity(.82)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                    AppIcons.manual,
                      color: !isimage ? appcolors.whicolor : appcolors.black2,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'الملئ يدويا',
                      style: TextStyle(
                        color: !isimage ? appcolors.whicolor : appcolors.black2,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: Appstring.fontfamily,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
