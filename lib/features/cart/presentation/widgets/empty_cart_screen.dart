import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:80.h),
      child: Container(
        color: appcolors.whicolor,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Appimage.emptycart),
                SizedBox(height: 24.h),
                Text(
                Appstring.emptyCartNow,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: appcolors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: Appstring.fontfamily,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                 Appstring.emptyCartAddProduct,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                    fontFamily: Appstring.fontfamily,
                  
                  ),
                  textAlign: TextAlign.center,
              
                ),
                SizedBox(height: 32.h),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Custombutton(
                    text: Appstring.shopProducts,
                    onPressed: () {},
                    icon: AppIcons.shoppingBag,
                    color: appcolors.primarycolor,
                    backgroundColor: appcolors.buttoncoloronboarding,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
