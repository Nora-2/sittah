import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class MedicalLensesSection extends StatelessWidget {
  const MedicalLensesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),

      child: ExpansionTile(
        tilePadding: EdgeInsets.all(4.h),
        childrenPadding: EdgeInsets.only(bottom: 8.h),
        trailing: Icon(
          Icons.keyboard_arrow_down,
          size: 40.w,
          color: appcolors.black2,
        ),
        title: Text(
          Appstring.medicalLenses,
          style: TextStyle(
            fontSize: 16.sp, // Responsive font size
            fontWeight: FontWeight.w500,
            fontFamily: Appstring.fontfamily,
            color: appcolors.black2,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.w,
            ), // Responsive padding
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLensOption(Appstring.progressiveLenses),
                    _buildLensOption(Appstring.readingGlasses),

                    _buildLensOption('عدسات حجب الضوء الازرق'),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLensOption(Appstring.coloredLenses),
                    _buildLensOption('عدسات فوتوكرومية'),

                    _buildLensOption(Appstring.drivingLenses),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLensOption(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h), // Responsive padding
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: appcolors.grayviewall,
            size: 16.w,
          ), // Responsive icon size
          SizedBox(width: 2.w), // Responsive width
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: Appstring.fontfamily,
              color: appcolors.grayviewall,
            ), // Responsive font size
          ),
        ],
      ),
    );
  }
}
