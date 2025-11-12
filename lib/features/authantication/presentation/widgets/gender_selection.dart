// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

enum Gender { male, female }

class GenderRadioOption extends StatelessWidget {
  final Gender value;
  final Gender? groupValue;
  final String label;
  final String icon; // Placeholder for custom image
  final ValueChanged<Gender?> onChanged;

  const GenderRadioOption({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool _ = (value == groupValue);

    return GestureDetector(
      onTap: () =>
          onChanged(value), // Tapping the container changes the radio state
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 8.h,
        ), // Adjusted padding

        child: Row(
          children: [
            // This is the actual Radio widget
            Radio<Gender>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: appcolors.black,
              fillColor: WidgetStateProperty.resolveWith<Color>((
                Set<MaterialState> states,
              ) {
                if (states.contains(MaterialState.selected)) {
                  return appcolors.black; // Color when selected
                }
                return Colors.grey; // Color when unselected
              }),
            ),
            SizedBox(width: 5.w), // Smaller gap between radio and text
            Text(
              label,
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[500],fontFamily: Appstring.fontfamily),
              textDirection: TextDirection.rtl, // For Arabic text
            ),
            SizedBox(width: 10.w),
            // Placeholder for the image. Replace with Image.asset if needed.
           SvgPicture.asset(icon)
          ],
        ),
      ),
    );
  }
}
