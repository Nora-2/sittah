import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class LensDetailsContent extends StatelessWidget {
  const LensDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLensFeatureCard(
          Appstring.photochromic,
          Appstring.photochromicDescription,
          Icons.brightness_medium,
        ),
        SizedBox(height: 12.h), // Responsive height
        _buildLensFeatureCard(
          Appstring.driving,
          Appstring.drivingDescription,
          Icons.directions_car,
        ),
        SizedBox(height: 12.h), // Responsive height
        _buildLensFeatureCard(
          Appstring.colored,
          Appstring.coloredDescription,
          Icons.color_lens,
        ),
        SizedBox(height: 12.h), // Responsive height
        _buildLensFeatureCard(
          Appstring.blueLightBlocking,
          Appstring.blueLightBlockingDescription,
          Icons.remove_red_eye,
        ),
        SizedBox(height: 12.h), // Responsive height
        _buildLensFeatureCard(
          Appstring.polarized,
          Appstring.polarizedDescription,
          Icons.filter_hdr,
        ),
      ],
    );
  }

  Widget _buildLensFeatureCard(
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
