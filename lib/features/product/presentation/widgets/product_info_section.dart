import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/cart/presentation/widgets/klarna.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            textDirection: TextDirection.ltr,

            children: [
              Text(
                '500 د.ع',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 11.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: appcolors.graylinethrough,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '500 د.ع',
                style: TextStyle(
                  fontSize: 14.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: appcolors.buttoncoloronboarding,
                ),
              ),
              Spacer(),
              Text(
                Appstring.glassesTitle,
                style: TextStyle(
                  fontSize: 18.sp, // Responsive font size
                  fontWeight: FontWeight.w700,
                  color: appcolors.black,
                  fontFamily: Appstring.fontfamily,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h), // Responsive height
          Text(
            Appstring.glassesDescription,
            style: TextStyle(
              fontSize: 11.sp,
              fontFamily: Appstring.fontfamily, // Responsive font size
              color: appcolors.graylinethrough,
            ),
          ),
          SizedBox(height: 16.h), // Responsive height
          _buildDiscountTag(),
          SizedBox(height: 8.h), // Responsive height
         klarna()
        ],
      ),
    );
  }

  Widget _buildDiscountTag() {
    return Container(
      width: 290.w,
      padding: EdgeInsets.symmetric(
      horizontal:4.w ,
        vertical: 4.h,
      ), // Responsive padding
      decoration: BoxDecoration(
        color: appcolors.greenDiscount,
        borderRadius: BorderRadius.circular(15.r), // Responsive border radius
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.discount,
            color: appcolors.buttoncoloronboarding,
          ),
          SizedBox(width: 2.w),
          Text(
            Appstring.discountText,
            style: TextStyle(
              color: appcolors.buttoncoloronboarding,
              fontSize: 12.sp,
              fontFamily: Appstring.fontfamily,
            ), // Responsive font size
          ),
        ],
      ),
    );
  }
}
