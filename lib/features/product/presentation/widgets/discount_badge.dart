import 'package:flutter/material.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/screenutils.dart';

class DiscountBadge extends StatelessWidget {
  final String discount;
  final Color? backgroundColor;

  const DiscountBadge({super.key, required this.discount, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtils.setWidth(6),
        vertical: ScreenUtils.setHeight(2),
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? appcolors.buttoncoloronboarding,
        borderRadius: BorderRadius.only(bottomRight:Radius.circular( ScreenUtils.setWidth(4)),topLeft:Radius.circular( ScreenUtils.setWidth(4)) ),
      ),
      child: Text(
        discount,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: ScreenUtils.setFontSize(10),
          fontWeight: FontWeight.w600,
          color:appcolors.primarycolor,
          fontFamily: Appstring.fontfamily
        ),
      ),
    );
  }
}
