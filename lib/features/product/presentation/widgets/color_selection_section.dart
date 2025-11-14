import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class ColorSelectionSection extends StatefulWidget {
  const ColorSelectionSection({super.key, required this.onColorSelected});

  final ValueChanged<String> onColorSelected;

  @override
  State<ColorSelectionSection> createState() => _ColorSelectionSectionState();
}

class _ColorSelectionSectionState extends State<ColorSelectionSection> {
  String _selectedColor = Appstring.black;

  Widget _buildColorOption(String colorName, String imagePath) {
    bool isSelected = _selectedColor == colorName;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = colorName;
          widget.onColorSelected(colorName);
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: 4.w),
        child: Column(
          children: [
            Container(
              width: 80.w, // Responsive width
              height: 60.h, // Responsive height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8.r,
                ), // Responsive border radius
                border: Border.all(
                  color: isSelected ? appcolors.accent : appcolors.borderColor,
                  width: isSelected ? 2.w : 1.w, // Responsive border width
                ),
                color: appcolors.cardBackground,
              ),
              child: Image.asset(imagePath),
            ),
            SizedBox(height: 8.h), // Responsive height
            Text(
              colorName,
              style: TextStyle(
                fontSize: 10.sp, // Responsive font size
                color: appcolors.textBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4, right: 4, top: 8), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'لون الإطار: ', // First part
              style: TextStyle(
                color: appcolors.grey66,
                fontSize: 16,
                fontFamily: Appstring.fontfamily,
              ),
              children: [
                TextSpan(
                  text: _selectedColor,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: appcolors.black,
                    fontFamily: Appstring.fontfamily,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h), // Responsive height
          SizedBox(
            height: 90.h,
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,

              reverse: true,
              children: [
                _buildColorOption(Appstring.brown, Appimage.productBrown),
                _buildColorOption(Appstring.red, Appimage.productRed),
                _buildColorOption(Appstring.blue, Appimage.productBlue),
                _buildColorOption(Appstring.beige, Appimage.productBeige),
                _buildColorOption(Appstring.black, Appimage.productBeige),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
