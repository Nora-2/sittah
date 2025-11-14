import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart'; // Assuming you have this

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h, // Adjusted height to accommodate the glass icon
      color: appcolors.whicolor,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // The order here should match the _screens list and the visual RTL order
          _buildNavItem(
            icon: AppIcons.elements,
            label: Appstring.nav1,
            index: 0,
            isActive: selectedIndex == 0,
          ),
          _buildNavItem(
            icon: AppIcons.shoppingcartcheck,
            label: Appstring.nav2,
            index: 1,
            isActive: selectedIndex == 1,
          ),
          _buildNavItem(
            icon: AppIcons.store, // Changed to class_outlined for 'الفئات'
            label: Appstring.nav4, // Changed from 'المنتجات' to 'الفئات'
            index: 2,
            isActive: selectedIndex == 2,
          ),
          _buildNavItem(
            icon: AppIcons.categories, // Changed to class_outlined for 'الفئات'
            label: Appstring.nav3, // Changed from 'المنتجات' to 'الفئات'
            index: 3,
            isActive: selectedIndex == 3,
          ),

          _buildNavItem(
            icon: AppIcons.home,
            label: Appstring.nav5,
            index: 4, // Changed index to 3
            isActive: selectedIndex == 4,
          ),
        ].toList(),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required int index,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Visibility(
            visible: isActive,
            child: Align(
              alignment: AlignmentGeometry.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Icon(
                  MyFlutterApp.vector_7268,
                  size: 10,
                  color: appcolors.buttoncoloronboarding,
                ),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: isActive
                ? BoxDecoration(
                    color: appcolors.navbaractive, // Bright green color
                    borderRadius: BorderRadius.circular(15),
                  )
                : null,
            child: SvgPicture.asset(
              icon,
              color: isActive
                  ? appcolors.buttoncoloronboarding
                  : appcolors.graylinethrough,
              height: 28,
              width: 28,
            ),
          ),

          Text(
            label,
            style: TextStyle(
              color: isActive
                  ? appcolors.buttoncoloronboarding
                  : appcolors.graylinethrough,
              fontSize: 12,
              fontFamily: Appstring.fontfamily,
            ),
          ),
        ],
      ),
    );
  }
}
