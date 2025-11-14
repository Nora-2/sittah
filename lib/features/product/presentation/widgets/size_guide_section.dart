import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/product/presentation/widgets/customdilogbottom.dart';

class SizeGuideSection extends StatelessWidget {
  const SizeGuideSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 8.h,
      ), // Responsive margin

      child: Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          GestureDetector(
            onTap: () {
              showCustomDialog(context);
            },
            child: Icon(
              MyFlutterApp.arrow_left,
              color: appcolors.graylinethrough,
            ),
          ),
          SizedBox(width: 2.w),
          Text(
            Appstring.sizeGuide,
            style: TextStyle(
              fontSize: 16.sp, // Responsive font size
              color: appcolors.graylinethrough,
            ),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
              text: 'المقاس: ', // First part
              style: TextStyle(
                color: appcolors.graylinethrough,
                fontSize: 16,
                fontFamily: Appstring.fontfamily,
              ),
              children: [
                TextSpan(
                  text:Appstring.medium,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,

                    color: appcolors.black,
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
