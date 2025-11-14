import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class ProductTabs extends StatelessWidget {
  final String selectedTab;
  final ValueChanged<String> onTabSelected;

  const ProductTabs({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h), // Responsive margin
      padding: EdgeInsets.symmetric(horizontal: 8.w), // Responsive padding

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem(Appstring.productDetails),
          _buildTabItem(Appstring.lensDetails),
          _buildTabItem(Appstring.shippingAndReturns),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title) {
    bool isSelected = selectedTab == title;
    return GestureDetector(
      onTap: () => onTabSelected(title),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 5.w,
        ), // Responsive padding
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? appcolors.buttoncoloronboarding
                  : Colors.transparent,
              width: 1.5.w, // Responsive border width
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp, // Responsive font size
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            color: isSelected
                ? appcolors.buttoncoloronboarding
                : appcolors.textGrey,
          ),
        ),
      ),
    );
  }
}
