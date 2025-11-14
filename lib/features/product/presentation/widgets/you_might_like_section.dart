import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/home/presentation/widgets/product_card.dart';

class YouMightLikeSection extends StatelessWidget {
  const YouMightLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.all(8.w), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              Appstring.youMightLike,
              style: TextStyle(
                fontSize: 18.sp, // Responsive font size
                fontWeight: FontWeight.bold,
                color: appcolors.textBlack,
              ),
            ),
            SizedBox(height: 16.h), // Responsive height
            SizedBox(
              height: 240.h, // Responsive height
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: SizedBox(
                      width: 200.w,
                      child: Expanded(child: ProductCard()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
