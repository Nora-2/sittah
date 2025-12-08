import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';

class CouponToggleSwitch extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onToggle;
  final int validCount;
  final int invalidCount;

  const CouponToggleSwitch({
    Key? key,
    required this.selectedIndex,
    required this.onToggle,
    required this.validCount,
    required this.invalidCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Light grey background
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          // Button 1: Unused / Valid (Right side in RTL)
          Expanded(
            child: _buildToggleButton(
              text: "القسائم غير المستخدمة ($validCount)",
              isSelected: selectedIndex == 0,
              onTap: () => onToggle(0),
            ),
          ),
          
          // Button 2: Expired / Invalid (Left side in RTL)
          Expanded(
            child: _buildToggleButton(
              text: "القسائم منتهية الصلاحية ($invalidCount)",
              isSelected: selectedIndex == 1,
              onTap: () => onToggle(1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? appcolors.buttoncoloronboarding : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}