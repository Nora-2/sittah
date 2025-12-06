import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:glasses/core/constants.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';

class lensOptionCard extends StatefulWidget {
  final String title;

  final VoidCallback onTap;
  final String image;

  const lensOptionCard({
    super.key,
    required this.title,
    
    required this.image,
   
    required this.onTap,
  });

  @override
  State<lensOptionCard> createState() => _lensOptionCardState();
}

class _lensOptionCardState extends State<lensOptionCard> {
  void toggleColor(Color color) {
    setState(() {
      if (Constants.selectedColors.contains(color)) {
        Constants.selectedColors.remove(color);
      } else {
        Constants.selectedColors.add(color);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.only(left: 8),
          height: 70.h,
          decoration: BoxDecoration(
            color: appcolors.whicolor,
            borderRadius: BorderRadius.circular(12.r),
           border:Border.all(width: 1,color:appcolors.borderColor)
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: Appstring.fontfamily,
                      color: appcolors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                 
                  SizedBox(height: 5.h),
                ],
              ),
              Spacer(),
              Icon(MyFlutterApp.arrow_left),
            ],
          ),
        ),
      ),
    );
  }
}
