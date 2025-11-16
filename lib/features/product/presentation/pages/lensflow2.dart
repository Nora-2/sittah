import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/screenutils.dart';
import 'package:glasses/core/utils/textstyle/textstyle.dart';
import 'package:glasses/features/product/presentation/lens_prescriptionflow_widgets/image.dart';
import 'package:glasses/features/product/presentation/lens_prescriptionflow_widgets/lenstogeltabs.dart';
import 'package:glasses/features/product/presentation/lens_prescriptionflow_widgets/manual.dart';
import 'package:glasses/features/product/presentation/pages/lenstype_without_doctor.dart';
import 'package:glasses/features/product/presentation/pages/pricesummarylens.dart';
import '../widgets/stepindecator.dart';

class LensType2Screen extends StatefulWidget {
  final int stepNumber;

  const LensType2Screen({super.key, required this.stepNumber});

  @override
  State<LensType2Screen> createState() => _LensType2ScreenState();
}

class _LensType2ScreenState extends State<LensType2Screen> {
  bool isImage = false; // state variable

  void toggleImage() {
    setState(() {
      isImage = !isImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);

    return Scaffold(
      backgroundColor: appcolors.whicolor,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, size: 15.sp),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 4.w),
                Text(
                  Appstring.back,
                  style: TextStyle(
                    fontFamily: Appstring.fontfamily,
                    fontSize: 17.sp,
                    color: appcolors.black,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtils.setHeight(12),
              ),
              child: StepIndicator(
                currentStep: widget.stepNumber,
                totalSteps: 4,
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(ScreenUtils.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'ادخل وصفتك الطبية',
                          style: AppTextStyles.heading.copyWith(
                            fontFamily: Appstring.fontfamily,
                          ),
                        ),
                        SizedBox(width: ScreenUtils.setWidth(8)),
                        SvgPicture.asset(
                          AppIcons.questionmark,
                          color: appcolors.grey66,
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtils.setHeight(16)),

                    // Lens Tabs
                    lensTabs(
                      isimage: isImage,
                      onTapimage: toggleImage,
                      onTapmanual: toggleImage,
                    ),
                    SizedBox(height: 10.h),
                    !isImage ? lensmanual() : lensimage(),
                  ],
                ),
              ),
            ),
            // Price Summary
            PriceSummarylens(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                      const  LenstypewithoutdoctorScreen(stepNumber: 3),
                  ),
                );
              },
              total: 500,
              currentstep: widget.stepNumber,
            ),
          ],
        ),
      ),
    );
  }
}
