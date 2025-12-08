import 'package:flutter/material.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class NotificationTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const NotificationTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ['الكل', 'تمت قراءتها', 'غير مقروءة'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(
          tabs.length,
          (index) => Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: index < 2 ? 8 : 0),
              child: GestureDetector(
                onTap: () => onTabSelected(index),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? appcolors.buttoncoloronboarding
                        : appcolors.graylinethrough.withOpacity(.01),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: selectedIndex == index
                          ? appcolors.graylinethrough.withOpacity(.01)
                          : appcolors.categorytapbar,
                    ),
                  ),
                  child: Text(
                    tabs[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: selectedIndex == index
                          ? appcolors.whicolor
                          : appcolors.gray700,
                      fontWeight: FontWeight.w600,
                      fontFamily: Appstring.fontfamily,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
