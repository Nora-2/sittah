import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/constants.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/screenutils.dart';
import 'package:glasses/features/product/presentation/widgets/discount_badge.dart';

class PrescriptionOptionCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? discount;
  final bool isSelected;
  final List<Color>? colors;
  final VoidCallback onTap;

  const PrescriptionOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.discount,
    required this.isSelected,
    this.colors,
    required this.onTap,
  });

  @override
  State<PrescriptionOptionCard> createState() => _PrescriptionOptionCardState();
}

class _PrescriptionOptionCardState extends State<PrescriptionOptionCard> {
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
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 8),
              height: 100.h,
              decoration: BoxDecoration(
                color: appcolors.whicolor,
                borderRadius: BorderRadius.circular(ScreenUtils.setWidth(12)),
                border: Border.all(
                  color: widget.isSelected
                      ? appcolors.buttoncoloronboarding
                      : appcolors.border,
                  width: widget.isSelected ? 1 : 1,
                ),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: appcolors.graylinethrough.withOpacity(.2),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(ScreenUtils.setWidth(12)),
                        bottomRight: Radius.circular(ScreenUtils.setWidth(12)),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppIcons.frameonly,
                        color: appcolors.black,
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
                      SizedBox(height: 4.h),
                      Text(
                        widget.subtitle,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: Appstring.fontfamily,
                          color: appcolors.grayviewall,
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(width: 210.w, child: _buildColorSection()),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: ScreenUtils.setWidth(24),
                    height: ScreenUtils.setWidth(24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: widget.isSelected
                            ? appcolors.buttoncoloronboarding
                            : appcolors.border,
                        width: 2,
                      ),
                      color: widget.isSelected
                          ? appcolors.buttoncoloronboarding
                          : Colors.transparent,
                    ),
                    child: widget.isSelected
                        ? Icon(
                            Icons.check,
                            size: ScreenUtils.setWidth(16),
                            color: appcolors.primarycolor,
                          )
                        : null,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
             top: 0,
              child: DiscountBadge(discount: '40 د.ع')),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.end,
          spacing: 5.w,
          runSpacing: 5.h,
          children: Constants.color.map((color) {
            final isSelected = Constants.selectedColors.contains(color);
            return GestureDetector(
              onTap: () => toggleColor(color),
              child: Container(
                width: 25.w,
                height: 25.w,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? appcolors.buttoncoloronboarding
                        : Colors.grey.shade300,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: isSelected
                    ? Icon(Icons.check, color: appcolors.whicolor, size: 18)
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
