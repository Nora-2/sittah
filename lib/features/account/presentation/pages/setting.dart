import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/account/data/models/userprofile.dart';
import 'package:glasses/features/account/presentation/pages/change_currancy.dart';
import 'package:glasses/features/account/presentation/pages/change_password.dart';
import 'package:glasses/features/account/presentation/widgets/checkemail.dart';
import 'package:glasses/features/account/presentation/widgets/checkphon.dart';
import 'package:glasses/features/account/presentation/widgets/deleteaccount.dart';

class GeneralSettingsScreen extends StatelessWidget {
  final UserProfile user;
  const GeneralSettingsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              appcolors.gradient1,
              appcolors.gradient2,
              appcolors.whicolor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: 100.h,

                alignment: Alignment.center,
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 18.sp),
                      color: appcolors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "الاعدادات العامة",
                      style: TextStyle(
                        fontFamily: Appstring.fontfamily,
                        fontSize: 17.sp,
                        color: appcolors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // balance right spacing
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
                      crossAxisAlignment:
                          CrossAxisAlignment.end, // RTL Alignment
                      children: [
                        _buildSectionTitle("الشخصية"),
                        SizedBox(height: 10.h),
                        _buildActionTile("البريد الالكتروني", () {
                          showCustomDialogemail(context);
                        }, value: user.email),
                        SizedBox(height: 10.h),
                        _buildDivider(),
                        SizedBox(height: 10.h),
                        _buildActionTile("رقم الهاتف", () {
                          showCustomDialogphone(context);
                        }, value: user.phone),
                        SizedBox(height: 10.h),
                        _buildDivider(),
                        SizedBox(height: 10.h),
                        _buildActionTile("تغيير العملة", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeCurrencyScreen(),
                            ),
                          );
                        }, value: "د.ع"),
                        SizedBox(height: 10.h),
                        _buildDivider(),
                        SizedBox(height: 10.h),
                        _buildActionTile("تغيير الرقم السري", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangePasswordScreen(),
                            ),
                          );
                        }, value: "***************"),
                        SizedBox(height: 10.h),
                        _buildDivider(),
                        SizedBox(height: 10.h),
                        InkWell(
                          onTap: () {
                            showCustomDialogdelete(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                AppIcons.trash,
                                color: appcolors.graylinethrough,
                                height: 20,
                              ),
                              Text(
                                "حذف الحساب",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),

                        _buildSectionTitle("المزيد"),
                        SizedBox(height: 10.h),
                        _buildActionTile("قصتنا", () {}),
                        SizedBox(height: 10.h),
                        _buildDivider(),
                        SizedBox(height: 10.h),
                        _buildActionTile("تواصل معنا", () {}),
                        SizedBox(height: 10.h),
                        _buildDivider(),
                        SizedBox(height: 10.h),
                        _buildActionTile("سياسة الخصوصية", () {}),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h, top: 5.h),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontFamily: Appstring.fontfamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActionTile(String title, Function()? onTap, {String? value}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Icon(Icons.arrow_back_ios, size: 14.sp, color: Colors.grey),
          ),
          if (value != null) ...[
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
            ),
          ] else ...[
            const Spacer(),
          ],
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() => Divider(height: 1, color: Colors.grey.shade200);
}
