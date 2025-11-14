import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class ShippingReturnsContent extends StatelessWidget {
  const ShippingReturnsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildShippingReturnCard(
          Appstring.warranty365Days,
          Appstring.warrantyDescription,
          Icons.security,
        ),
        SizedBox(height: 12.h), // Responsive height
        _buildShippingReturnCard(
          Appstring.returns30Days,
          Appstring.returnsDescription,
          Icons.cached,
        ),
        SizedBox(height: 20.h), // Responsive height
        Text(
          Appstring.shippingInfo,
          style: TextStyle(
            fontSize: 11.sp,
            color: appcolors.textGrey,
            fontFamily: Appstring.fontfamily,
          ), // Responsive font size
        ),
        SizedBox(height: 10.h), // Responsive height
        GestureDetector(
          onTap: () {
            // Navigate to full shipping policy
          },
          child: RichText(
            text: TextSpan(
              text: 'يرجى النقر على ',
              style: TextStyle(
                color: appcolors.graylinethrough,
                fontSize: 11,
                fontFamily: Appstring.fontfamily,
              ),
              children: [
                TextSpan(
                  text: 'الشحن والارجاع',
                  style: TextStyle(
                    fontSize: 10,
                    decoration: TextDecoration.underline,
                    color: appcolors.buttoncoloronboarding,
                    fontFamily: Appstring.fontfamily,
                  ),
                ),
                TextSpan(
                  text: ' لعرض سياسة الشحن والارجاع الكاملة.',
                  style: TextStyle(
                    color: appcolors.graylinethrough,
                    fontSize: 11,
                    fontFamily: Appstring.fontfamily,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShippingReturnCard(
    String title,
    String description,
    IconData icon,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w), // Responsive padding
      decoration: BoxDecoration(
        color: appcolors.graytestonboard.withOpacity(.1),
        borderRadius: BorderRadius.circular(8.r), // Responsive border radius
        border: Border.all(color: appcolors.borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: appcolors.buttoncoloronboarding,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, size: 30.w, color: appcolors.whicolor),
          ),
          SizedBox(width: 16.w), // Responsive width
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: appcolors.textBlack,
                    fontFamily: Appstring.fontfamily,
                  ),
                ),
                SizedBox(height: 4.h), // Responsive height
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 11.sp, // Responsive font size
                    color: appcolors.textGrey,
                    fontFamily: Appstring.fontfamily,
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
