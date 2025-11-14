import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class IncludedSection extends StatelessWidget {
  const IncludedSection({super.key});

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
          Appstring.included,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: appcolors.black2,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIncludedItem(Appstring.warranty365Days),
_buildIncludedItem(Appstring.worryFreeDelivery),
_buildIncludedItem(Appstring.returnsAndExchange30Days),
_buildIncludedItem(Appstring.freeShippingOver79),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncludedItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Icon(Icons.check, color: appcolors.grayviewall, size: 20.w),
          SizedBox(width: 4.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: appcolors.grayviewall,
              fontFamily: Appstring.fontfamily,
            ),
          ),
        ],
      ),
    );
  }
}
