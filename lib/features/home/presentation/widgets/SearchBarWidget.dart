import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/home/presentation/widgets/filter.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.search);
      },
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: appcolors.whicolor,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.search);
              },
              child: SvgPicture.asset(AppIcons.search),
            ),
            SizedBox(width: 4.w),

            Text(
              Appstring.searchtext,
              style: TextStyle(
                color: appcolors.graytestonboard.withOpacity(.6),
                fontSize: 13.sp,
                fontFamily: Appstring.fontfamily,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                // ignore: unused_local_variable
                final result = await GlassesFilterSheet.show(context);
              },
              child: Icon(
                MyFlutterApp.filter_horizontal__3_,
                color: appcolors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
