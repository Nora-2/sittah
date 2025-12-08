// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';

class AuthHeader extends StatelessWidget {
  AuthHeader({super.key, required this.islogin});
  bool islogin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_forward_ios, size: 15.sp),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(width: 4.w),
              Text(
                Appstring.back,
                style: TextStyle(
                  fontFamily: Appstring.fontfamily,
                  fontSize: 17.sp,
                  color: appcolors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
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
                    islogin ? Appstring.loginTitle : Appstring.signuptitel,
                    style: TextStyle(
                      fontSize: 18.sp,
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
                      size: 30.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                islogin ? Appstring.loginsubtitel : Appstring.signupsubtitel,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],

                  fontFamily: Appstring.fontfamily,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
