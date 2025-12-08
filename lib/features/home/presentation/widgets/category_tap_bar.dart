import 'package:flutter/material.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class CategoryTapBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CategoryTapBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Appstring.category5,
      Appstring.category4,
      Appstring.category3,
      Appstring.category2,
      Appstring.category1,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: List.generate(
          tabs.length,
          (index) => Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 4),
              child: GestureDetector(
                onTap: () => onTabSelected(index),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
