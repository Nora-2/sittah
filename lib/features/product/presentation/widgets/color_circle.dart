
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';

class ColorSelector extends StatelessWidget {
  final List<Color> colors;
  final int? selectedIndex;
  final Function(int)? onColorSelected;

  const ColorSelector({
    super.key,
    required this.colors,
    this.selectedIndex,
    this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        colors.length,
        (index) => Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: _ColorCircle(
            color: colors[index],
            isSelected: selectedIndex == index,
            onTap: () => onColorSelected?.call(index),
          ),
        ),
      ),
    );
  }
}

class _ColorCircle extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  const _ColorCircle({
    required this.color,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:24.w,
        height: 24.w,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(color: appcolors.primarycolor, width: 2)
              : null,
        ),
      ),
    );
  }
}
