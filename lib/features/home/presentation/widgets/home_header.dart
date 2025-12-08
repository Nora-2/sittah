import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final name = Appstring.ahmed;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25.r),
          bottomLeft: Radius.circular(25.r),
        ),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.center, // 👈 Top alignment
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22.r,
            backgroundColor: appcolors.transcolor,
            child: Image.asset(Appimage.homemain, fit: BoxFit.fill),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    '${Appstring.homemainheader}$name',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: appcolors.black,

                      fontFamily: Appstring.fontfamily,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Center(
                    child: Icon(
                      MyFlutterApp.hand_469603_1__1_,
                      color: appcolors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    Appstring.homemainheaderdesc,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey[500],

                      fontFamily: 'Montserratregular',
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Center(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[500],
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Row(
            textDirection: TextDirection.rtl,
            children: [
                InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.favourite
                  );
                },
                child:
              CircleAvatar(
                radius: 20.r,
                backgroundColor: appcolors.whicolor,
                child: Icon(MyFlutterApp.heart, color: Colors.black, size: 24),
              ),),
              SizedBox(width: 10.w),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.notification
                  );
                },
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: appcolors.whicolor,
                  child: Icon(
                    MyFlutterApp.notification,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
