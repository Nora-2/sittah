// widgets/step_indicator.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            textDirection: TextDirection.rtl,
            '$currentStep من $totalSteps',
            style: TextStyle(
              color: appcolors.black,
              fontFamily: Appstring.fontfamily,
              fontSize:14.sp,
            ),
          ),
          SizedBox(height:8.h),
          // Progress bar
          StepProgressIndicator(
            progressDirection:TextDirection.rtl,
            currentStep: currentStep,
            totalSteps: totalSteps,
           padding: 0,
           roundedEdges: Radius.circular(15.r),
           selectedSize: 8.h,
           unselectedSize: 8.h,
            selectedColor: appcolors.buttoncoloronboarding,
            unselectedColor: appcolors.textfieldborder,
          ),
        ],
      ),
    );
  }
}
