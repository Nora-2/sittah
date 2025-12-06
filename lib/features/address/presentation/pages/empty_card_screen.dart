import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/address/presentation/pages/address.dart';

class EmptyCardsScreen extends StatelessWidget {
  const EmptyCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              appcolors.gradient1,
              appcolors.whicolor,
              appcolors.whicolor,
              appcolors.whicolor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ----- Custom AppBar -----
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 20.sp),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      "بطاقاتي",
                      style: TextStyle(
                        fontFamily: Appstring.fontfamily,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              // ------- CONTENT -------
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: appcolors.whicolor,
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      children: [
                       SizedBox(height: 40.h),

                        Image.asset(
                          Appimage.item,
                          width: 260.w,
                          height: 200.w,
                          fit: BoxFit.fill,
                        ),

                        SizedBox(height: 32.h),

                        Text(
                          'لا توجد بطاقات محفوظة بعد',
                          style: TextStyle(
                            fontFamily: Appstring.fontfamily,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12.h),

                        Text(
                          'أضف بطاقتك الآن لتجعل عملية الدفع أسرع وأسهل في المرات القادمة.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: Appstring.fontfamily,
                            fontSize: 15.sp,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),

                         SizedBox(height: 40.h),

                        CustomButton(
                          text: 'ابدا التسوق',
                          icon: AppIcons.bag2,
                          onPressed: () {},
                        ),

                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
