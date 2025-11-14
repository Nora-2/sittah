import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/home/presentation/widgets/SearchBarWidget.dart';
import 'package:glasses/features/home/presentation/widgets/categorygrid.dart';

class AllCtegoriesScreen extends StatefulWidget {
  const AllCtegoriesScreen({super.key});

  @override
  State<AllCtegoriesScreen> createState() => _AllCtegoriesScreenState();
}

class _AllCtegoriesScreenState extends State<AllCtegoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
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
                Container(
                  height: 100.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, size: 18.sp),
                        color: appcolors.black,
                        onPressed: () {},
                      ),
                      Expanded(
                        child: Text(
                          Appstring.allcategories,
                          style: TextStyle(
                            fontFamily: Appstring.fontfamily,
                            fontSize: 17.sp,
                            color: appcolors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 48.w), // balance right spacing
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: Container(
                      width: double.infinity,
                      height: height * 1.08,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 25,
                      ),
                      decoration: BoxDecoration(color: appcolors.whicolor),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          const SearchBarWidget(),

                          SizedBox(height: 10.h),
                          CategoryGrid(),
                        ],
                      ),
                    ),
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
