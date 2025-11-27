import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String> imageUrls;

  const ProductImageSlider({super.key, required this.imageUrls});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  late PageController _pageController;
  int currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: double.infinity,

      decoration: BoxDecoration(
        color: appcolors.cardBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              textDirection: TextDirection.rtl,

              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, size: 15.sp),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),

                Text(
                  Appstring.back,
                  style: TextStyle(
                    fontFamily: Appstring.fontfamily,
                    fontSize: 17.sp,
                    color: appcolors.black,
                  ),
                ),

                Spacer(),

                Icon(MyFlutterApp.heart),
              ],
            ),
          ),
          SizedBox(
            height: 140.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imageUrls.length,
              onPageChanged: (index) {
                setState(() {
                  currentImageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Image.asset(widget.imageUrls[index], width: 240.w),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${currentImageIndex + 1}/${widget.imageUrls.length}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: appcolors.textGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(width: 110.w),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: widget.imageUrls.length,
                  textDirection: TextDirection.rtl,
                  effect: SlideEffect(
                    activeDotColor: appcolors.textBlack,
                    dotColor: appcolors.textGrey.withOpacity(0.4),
                    dotHeight: 6.w,
                    dotWidth: 6.w,
                    spacing: 2.w,
                  ),
                ),

                SizedBox(width: 40.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                     Routes.glassesProductScreen
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: appcolors.whicolor,
                      borderRadius: BorderRadius.circular(25.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          'جربها الآن',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: appcolors.textBlack,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        SvgPicture.asset(
                         AppIcons.tryIt,
                          width: 18.w,
                          height: 18.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
