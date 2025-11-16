import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/screenutils.dart';
import 'package:glasses/core/utils/textstyle/textstyle.dart';
import 'package:glasses/features/product/presentation/lens_prescriptionflow_widgets/lensotioncard.dart';
import 'package:glasses/features/product/presentation/pages/lensflow2.dart';
import 'package:glasses/features/product/presentation/pages/pricesummarylens.dart';
import 'package:glasses/features/product/presentation/widgets/stepindecator.dart';

class LensTypeScreen extends StatefulWidget {
  final int stepNumber;

  const LensTypeScreen({super.key, required this.stepNumber});

  @override
  State<LensTypeScreen> createState() => _LensTypeScreenState();
}

class _LensTypeScreenState extends State<LensTypeScreen> {
  int? selectedOption;

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
                          widget.stepNumber == 1
                              ? Appstring.prescriptionType
                              : Appstring.lensType,
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
                    lensOptionCard(
                      title: 'رؤية أحادية',
                      image: 'assets/images/lens1.png',
                      onTap: () {},
                    ),
                    SizedBox(height: 10.h),
                    lensOptionCard(
                      title: 'بدون وصفة طبية',
                      image: 'assets/images/lens2.png',
                      onTap: () {},
                    ),
                    // Options
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
                    builder: (BuildContext context) => LensType2Screen (stepNumber: 2,),
                  ),
                );
              },
              total: widget.stepNumber == 1 ? 500 : 540,
              currentstep: widget.stepNumber,
            ),
          ],
        ),
      ),
    );
  }
}
