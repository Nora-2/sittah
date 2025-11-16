import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/screenutils.dart';
import 'package:glasses/core/utils/textstyle/textstyle.dart';
import 'package:glasses/features/product/presentation/pages/pricesummarylens.dart';
import 'package:glasses/features/product/presentation/widgets/stepindecator.dart';
import '../widgets/prescription_option_card.dart';

class LenstypewithoutdoctorScreen extends StatefulWidget {
  final int stepNumber;

  const LenstypewithoutdoctorScreen({super.key, required this.stepNumber});

  @override
  State<LenstypewithoutdoctorScreen> createState() =>
      _LenstypewithoutdoctorScreenState();
}

class _LenstypewithoutdoctorScreenState
    extends State<LenstypewithoutdoctorScreen> {
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
            
            // Back button
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
            
            // Step indicator
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
         
            
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.stepNumber == 2 ? 'الطلاء' : 'نوع العدسة',
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
                        
                        // Options list
                        ...(_buildOptions()),
                      ],
                    ),
                  ),
                ),
           
            
            // Price Summary
            PriceSummarylens(
              onPressed: () {
                // Navigate to next step
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LenstypewithoutdoctorScreen(
                      stepNumber: widget.stepNumber + 1,
                    ),
                  ),
                );
              },
              total: widget.stepNumber == 2 ? 640 : 540,
              currentstep: widget.stepNumber,
            ),
          ]))
    );
  }

  List<Widget> _buildOptions() {
    if (widget.stepNumber == 3) {
      return [
        PrescriptionOptionCard(
          iscolors: false,
          title: 'حاجب الضوء الازرق',
          subtitle: 'عدسة تستخدم للموضة أو حماية العين',
          discount: 'ج.م 40',
          isSelected: selectedOption == 0,
          onTap: () => setState(() => selectedOption = 0),
        ),
        PrescriptionOptionCard(
          iscolors: false,
          title: 'عدسات النظارات القياسية',
          subtitle: 'عدسات ملونة تقلل من الوهج للنظارات \nالشمسية',
          discount: 'ج.م 10',
          isSelected: selectedOption == 1,
          onTap: () => setState(() => selectedOption = 1),
        ),
        PrescriptionOptionCard(
          iscolors: true,
          title: 'عدسات انتقالية',
          subtitle: 'عدسات ملونة تقلل من الوهج للنظارات \nالشمسية',
          discount: 'ج.م 150',
          isSelected: selectedOption == 2,
          onTap: () => setState(() => selectedOption = 2),
        ),
        PrescriptionOptionCard(
          iscolors: true,
          title: 'اللون الضوئي',
          subtitle: 'عدسات ملونة تقلل من الوهج للنظارات \nالشمسية',
          discount: 'ج.م 90',
          isSelected: selectedOption == 3,
          onTap: () => setState(() => selectedOption = 3),
        ),
      ];
    } else {
      return [
        PrescriptionOptionCard(
          iscolors: false,
          title: 'طلاء مضاد للانعكاس',
          subtitle: 'تقليل كل من الانعكاسات الداخلية والخارجية',
          discount: 'ج.م 40',
          isSelected: selectedOption == 0,
          onTap: () => setState(() => selectedOption = 0),
        ),
        PrescriptionOptionCard(
          iscolors: false,
          title: 'طلاء فائق الكارهية للماء',
          subtitle: 'يصد الأوساخ والماء، أسهل في التنظيف',
          discount: 'ج.م 40',
          isSelected: selectedOption == 1,
          onTap: () => setState(() => selectedOption = 1),
        ),
      ];
    }
  }
}