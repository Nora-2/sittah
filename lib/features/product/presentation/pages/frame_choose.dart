import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/screenutils.dart';
import 'package:glasses/core/utils/textstyle/textstyle.dart';
import 'package:glasses/features/product/presentation/widgets/stepindecator.dart';
import '../widgets/prescription_option_card.dart';
import '../widgets/price_summary.dart';

class PrescriptionStepScreen extends StatefulWidget {
  final int stepNumber;

  const PrescriptionStepScreen({
    super.key,
    required this.stepNumber,
  });

  @override
  State<PrescriptionStepScreen> createState() => _PrescriptionStepScreenState();
}

class _PrescriptionStepScreenState extends State<PrescriptionStepScreen> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);

    return Scaffold(
      backgroundColor: appcolors.whicolor,
     extendBodyBehindAppBar:true,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
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
              padding: EdgeInsets.symmetric(vertical: ScreenUtils.setHeight(12)),
              child: StepIndicator(
                currentStep: widget.stepNumber,
                totalSteps: 2,
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
                          style: AppTextStyles.heading.copyWith(fontFamily: Appstring.fontfamily),
                        ),
                        SizedBox(width: ScreenUtils.setWidth(8)),
                           SvgPicture.asset(
                         AppIcons.questionMark,
                          
                          color: appcolors.grey66,
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtils.setHeight(16)),
                    // Options
                    if (widget.stepNumber == 1) ..._buildStep1Options(),
                    if (widget.stepNumber == 2) ..._buildStep2Options(),
                  ],
                ),
              ),
            ),
            // Price Summary
            PriceSummary(
              onPressed:  () {
                            Navigator.pushNamed(context, Routes.framechoose);
                          },
              total: widget.stepNumber == 1 ? 500 : 540,currentstep:widget.stepNumber ,
              
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildStep1Options() {
    return [
      PrescriptionOptionCard(
        iscolors: true,
        title: Appstring.nonMedicalSunglasses,
        subtitle:Appstring.nonMedicalSunglassesDesc,
        discount: 'ج.م 0',
        isSelected: selectedOption == 0,
        onTap: () => setState(() => selectedOption = 0),
      ),
      PrescriptionOptionCard(
          iscolors: true,
        title: Appstring.medicalSunglasses,
        subtitle:Appstring.medicalSunglassesDesc,
        discount: 'ج.م 0',
        isSelected: selectedOption == 1,
        onTap: () => setState(() => selectedOption = 1),
      ),
      PrescriptionOptionCard(
          iscolors: true,
       title: Appstring.gradientSunglasses,
        subtitle:Appstring.gradientSunglassesDesc,
        discount: 'ج.م 90',
        isSelected: selectedOption == 2,
        onTap: () => setState(() => selectedOption = 2),
      ),
    ];
  }

  List<Widget> _buildStep2Options() {
    return [
      PrescriptionOptionCard(
          iscolors: true,
        title: Appstring.coloredLens,
        subtitle:    Appstring.coloredLensDesc,
        discount: 'ج.م 40',
        isSelected: selectedOption == 0,
       
        onTap: () => setState(() => selectedOption = 0),
      ),
      PrescriptionOptionCard(
          iscolors: true,
        title: Appstring.polarizedSunglassesLens,
        subtitle: Appstring.polarizedSunglassesLensDesc,
        discount: 'ج.م 40',
        isSelected: selectedOption == 1,
        
        onTap: () => setState(() => selectedOption = 1),
      ),
    ];
  }
}

