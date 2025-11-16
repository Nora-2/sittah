
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/screenutils.dart';
import 'package:glasses/core/utils/textstyle/textstyle.dart';
import 'package:glasses/features/product/presentation/lens_prescriptionflow_widgets/bottompartinmanual.dart';
import 'package:glasses/features/product/presentation/lens_prescriptionflow_widgets/pdproperity.dart';
import 'package:glasses/features/product/presentation/lens_prescriptionflow_widgets/tablelens.dart';
class lensmanual extends StatelessWidget {
  const lensmanual({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrescriptionSelector(),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Text(
              'المسافة الحدقية',
              style: AppTextStyles.heading.copyWith(
                fontFamily: Appstring.fontfamily,
              ),
            ),
            SizedBox(width: ScreenUtils.setWidth(8)),
            SvgPicture.asset(AppIcons.questionmark, color: appcolors.grey66),
          ],
        ),
        SizedBox(height: 5.h),
        PDSelector(),
        ArabicFormSection(),
      ],
    );
  }
}
