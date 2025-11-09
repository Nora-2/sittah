import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/appicons_icons.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';

class AuthTabs extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onTapLogin;
  final VoidCallback onTapSignup;

  const AuthTabs({
    super.key,
    required this.isLogin,
    required this.onTapLogin,
    required this.onTapSignup,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: appcolors.whicolor, // background for inactive tabs
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(width: 1,color: appcolors.grayviewall.withOpacity(.3))
      ),
      child: Row(
        children: [
          // Login Tab
          Expanded(
            child: GestureDetector(
              onTap: onTapLogin,
              child: Container(
                decoration: BoxDecoration(
                  color: isLogin ? appcolors.buttoncoloronboarding.withOpacity(.82) : Colors.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //change the icon
                    Icon(Appicons.user, color: isLogin ? appcolors.whicolor : appcolors.black2,),
                    SizedBox(width: 8.w),
                    Text(
                       Appstring.login,
                      style: TextStyle(
                        color: isLogin ? appcolors.whicolor : appcolors.black2,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: Appstring.fontfamily
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Signup Tab
          Expanded(
            child: GestureDetector(
              onTap: onTapSignup,
              child: Container(
                decoration: BoxDecoration(
                  color: !isLogin ? appcolors.buttoncoloronboarding.withOpacity(.82) : Colors.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                  
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MyFlutterApp.user_add, color: !isLogin ? appcolors.whicolor : appcolors.black2,),
                    SizedBox(width: 8.w),
                    Text(
                      Appstring.signUp,
                      style: TextStyle(
                        color: !isLogin ? appcolors.whicolor : appcolors.black2,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                              fontFamily: Appstring.fontfamily
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
