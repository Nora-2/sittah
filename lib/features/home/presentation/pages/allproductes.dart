import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/home/presentation/widgets/SearchBarWidget.dart';
import 'package:glasses/features/home/presentation/widgets/SectionHeader.dart';
import 'package:glasses/features/home/presentation/widgets/category_tap_bar.dart';
import 'package:glasses/features/home/presentation/widgets/product_card.dart';

class AllproductsScreen extends StatefulWidget {
  const AllproductsScreen({super.key});

  @override
  State<AllproductsScreen> createState() => _AllproductsScreenState();
}

class _AllproductsScreenState extends State<AllproductsScreen> {
  int selectedTab = 4;
  int items = 32;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                appcolors.gradient1,
                appcolors.gradient2,
                appcolors.whicolor,
                appcolors.whicolor,
                appcolors.whicolor,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 75.h), // below header
                  child: Container(
                    color: appcolors.whicolor,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            const SearchBarWidget(),

                            SizedBox(height: 10.h),
                            CategoryTapBar(
                              selectedIndex: selectedTab,
                              onTabSelected: (i) =>
                                  setState(() => selectedTab = i),
                            ),
                            SizedBox(height: 10.h),
                            SectionHeader(
                              title: Appstring.sectionheadertopsales,
                              onTap: () {},
                            ),
                            SizedBox(height: 10.h),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.w,
                                    mainAxisSpacing: 10.h,
                                    childAspectRatio: 0.66,
                                  ),
                              itemBuilder: (context, index) =>
                                  const ProductCard(),
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 100.h,

                  child: Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "($items ${Appstring.item})",
                        style: TextStyle(
                          fontFamily: Appstring.fontfamily,
                          fontSize: 12.sp,
                          color: appcolors.grayviewall,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        Appstring.products,
                        style: TextStyle(
                          fontFamily: Appstring.fontfamily,
                          fontSize: 17.sp,
                          color: appcolors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8.w), // balance right spacing
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
