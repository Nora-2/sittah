import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_button.dart';

class GlassesProductScreen extends StatefulWidget {
  const GlassesProductScreen({super.key});

  @override
  State<GlassesProductScreen> createState() => _GlassesProductScreenState();
}

class _GlassesProductScreenState extends State<GlassesProductScreen> {
  @override
  Widget build(BuildContext context) {
    double rate = 4.8;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Stack(
          children: [
            /// 🖼️ Top image (background)
            Positioned.fill(
              child: Image.asset(
                'assets/images/tryit.png', // Replace with your image
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 16.h,
              left: 16.w,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: appcolors.whicolor,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(6.w),
                  child: SvgPicture.asset(
                    AppIcons.close,
                    height: 22.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            /// ⚪ Bottom sheet overlay with content
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 20.h),
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /// 🔹 Header
                    Text(
                      Appstring.youMightLike,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: Appstring.fontfamily,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    /// 🔹 Horizontal List of Variants
                    SizedBox(
                      height: 90.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          VariantSelectionSection(
                            Appimage.productBeige,
                            Appstring.phantomVariant,
                            onSelected: (String value) {},
                          ),
                          VariantSelectionSection(
                            Appimage.productBlue,
                             Appstring.edgensVariant,
                            onSelected: (String value) {},
                          ),
                          VariantSelectionSection(
                            Appimage.productBrown,
                             Appstring.heritageVariant,
                            onSelected: (String value) {},
                          ),
                          VariantSelectionSection(
                            Appimage.productRed,
                            Appstring.fusionVariant,
                            onSelected: (String value) {},
                          ),
                          VariantSelectionSection(
                            Appimage.productBrown,
                           Appstring.whistleVariant,
                            onSelected: (String value) {},
                            isInitiallySelected: true,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10.h),
                    Text(
                     Appstring.glassesTitle,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: Appstring.fontfamily,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textDirection: TextDirection.rtl,
                          '500 د.ع',
                          style: TextStyle(
                            color: appcolors.primarycolor,
                            fontSize: 20.sp,
                            fontFamily: Appstring.fontfamily,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        SizedBox(width: 10.h),

                        /// 🔹 Rating
                        Row(
                          textDirection: TextDirection.ltr,
                          children: [
                            StarRating(
                              color: appcolors.whicolor,
                              size: 15.w,
                              rating: 4.8,
                              onRatingChanged: (rating) {
                                setState(() {
                                  rate = rating;
                                });
                              },
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              textDirection: TextDirection.rtl,
                              '$rate  (3 آلاف تقييم)',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    /// 🔹 Buttons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      textDirection: TextDirection.rtl,
                      children: [
                        Custombutton(
                          text: Appstring.frameOnly,
                          onPressed: () {},
                          color: appcolors.black,
                          backgroundColor: appcolors.background,
                          icon: AppIcons.glassframe
                        ),

                        // Responsive width
                        AuthButton(
                          text: Appstring.addLenses,
                          onPressed: () {},
                          color: appcolors.primarycolor,
                          backgroundColor: appcolors.buttoncoloronboarding,
                          icon: MyFlutterApp.arrow_left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VariantSelectionSection extends StatefulWidget {
  const VariantSelectionSection(
    this.imagePath,
    this.title, {
    super.key,
    required this.onSelected,
    this.isInitiallySelected = false,
  });

  final String imagePath;
  final String title;
  final ValueChanged<String> onSelected;
  final bool isInitiallySelected;

  @override
  State<VariantSelectionSection> createState() =>
      _VariantSelectionSectionState();
}

class _VariantSelectionSectionState extends State<VariantSelectionSection> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isInitiallySelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isSelected = true);
        widget.onSelected(widget.title);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Column(
          children: [
            Container(
              height: 50.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: isSelected ? appcolors.accent : appcolors.borderColor,
                  width: isSelected ? 2.w : 1.w,
                ),
                color: Colors.grey[100],
              ),
              child: Image.asset(widget.imagePath),
            ),
            SizedBox(height: 6.h),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 11.sp,
                color: isSelected ? Colors.white : appcolors.gray700,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
