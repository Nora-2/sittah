import 'package:flutter/material.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/appicons_icons.dart' show Appicons;
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_button.dart';
import 'package:glasses/features/product/presentation/lens_prescriptionflow_widgets/showproduct.dart';

class PriceSummarylens extends StatelessWidget {
  final double total;
  final int currentstep;
 final dynamic onPressed;

  const PriceSummarylens({
    super.key,
    required this.total,
    required this.currentstep,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
          color: appcolors.cardBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1.r, // Responsive spread radius
              blurRadius: 10.r, // Responsive blur radius
              offset: Offset(0, -3.h), // Responsive offset
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ), // Responsive padding
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    Appstring.totalAmount,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: Appstring.fontfamily,
                      color: appcolors.black,
                    ), // Responsive font size
                  ),
                  Spacer(),
                  Text(
                    textDirection: TextDirection.rtl,
                    '$total د.ع', // Dynamically update this
                    style: TextStyle(
                      fontSize: 18.sp, // Responsive font size
                      fontWeight: FontWeight.w800,
                      fontFamily: Appstring.fontfamily,
                      color: appcolors.buttoncoloronboarding,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  AuthButton(
                    text: 'مشاهدة المنتج',
                    onPressed: () {
                      showCustomDialogproductlens(context);
                    },
                    color: appcolors.black,
                    backgroundColor: appcolors.textGrey.withOpacity(.15),
                    icon: Appicons.input_prefix,
                  ),
                  Spacer(),
                  currentstep <=3
                      ? AuthButton(
                          text: Appstring.next,
                          onPressed: onPressed,
                          color: appcolors.primarycolor,
                          backgroundColor: appcolors.buttoncoloronboarding,
                          icon: MyFlutterApp.arrow_left,
                        )
                      : 
                      AuthButton(
                          text: Appstring.next,
                          onPressed:(){},
                          color: appcolors.primarycolor,
                          backgroundColor: appcolors.buttoncoloronboarding,
                          icon: MyFlutterApp.arrow_left,
                        )
                  // Responsive width
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
