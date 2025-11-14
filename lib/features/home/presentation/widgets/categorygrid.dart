import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/constants.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ), // Add some padding around the grid
      child: GridView.builder(
        shrinkWrap:
            true, // Important: Use this if GridView is inside a Column or another scrollable widget
        physics:
            NeverScrollableScrollPhysics(), // Disables scrolling for the grid itself if it's nested
        itemCount: Constants.categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of columns you want
          crossAxisSpacing: 10.w, // Horizontal spacing between items
          mainAxisSpacing: 10.h, // Vertical spacing between items
          childAspectRatio:
              0.75, // Adjust this ratio to control item height relative to width
        ),
        itemBuilder: (context, index) {
          final item = Constants.categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
               Routes.category
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30.r, // Slightly smaller radius for grid items
                  backgroundColor: Colors.grey[100],
                  child: Image.asset(
                    item['icon'] as String,
                    width: 60.w, // Adjust width and height for grid item
                    height: 60.h,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  item['name'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp, // Slightly smaller font size for grid
                    fontWeight: FontWeight.w500,
                    fontFamily: Appstring.fontfamily,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
