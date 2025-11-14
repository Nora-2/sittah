import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Center(child: Image.asset(Appimage.frame1)),
        Center(child: Image.asset(Appimage.frame2)),
        SizedBox(height: 20.h),
        _buildDetailRow(Appstring.sku, 'ZOP652540-04'),
        _buildDetailRow(Appstring.frameShape, 'مربع'),
        _buildDetailRow(Appstring.type, 'متوسط'),
        _buildDetailRow(Appstring.material, 'بلاستيك'),
        _buildDetailRow(Appstring.bridge, 'إطار كامل'),
        _buildDetailRow(Appstring.nosePads, 'لا'),
        _buildDetailRow(Appstring.weight, '25.6 جرام'),
        _buildDetailRow(Appstring.frameWidth, '132 مم'),
        _buildDetailRow(Appstring.lensWidth, '55 مم'),
        _buildDetailRow(Appstring.lensHeight, '51 مم'),
        _buildDetailRow(Appstring.armLength, '150 مم'),
        _buildDetailRow(Appstring.pdRange, '54-78'),

        // Responsive height
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h), // Responsive padding
          child: Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: appcolors.textBlack,
                ), // Responsive font size
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: appcolors.graylinethrough,
                ), // Responsive font size
              ),
            ],
          ),
        ),
        // Responsive height
      ],
    );
  }
}
