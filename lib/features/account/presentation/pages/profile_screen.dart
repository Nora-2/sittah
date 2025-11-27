import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/account/data/models/userprofile.dart';
import 'package:glasses/features/account/presentation/cubit/account_cubit.dart';
import 'package:glasses/features/account/presentation/pages/setting.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Providing Cubit locally for this screen
    return BlocProvider(
      create: (context) => ProfileCubit()..fetchProfileData(),
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
                appcolors.whicolor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: Color(0xFF1B3D46)),
                  );
                } else if (state is ProfileError) {
                  return Center(child: Text(state.message));
                } else if (state is ProfileLoaded) {
                  return _buildProfileContent(context, state.user);
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, UserProfile user) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          _buildHeader(context, user),
          SizedBox(height: 20.h),

          _buildStatsContainer(user),
          SizedBox(height: 20.h),

          _buildBanner(),
          SizedBox(height: 25.h),

          _buildSectionHeader("طلباتي (0)"),
          SizedBox(height: 15.h),
          _buildOrdersRow(),
          SizedBox(height: 25.h),

          Row(
            children: [
              Expanded(
                child: _buildPromoCard(
                  "شارك واربح",
                  "شارك زملائك",
                  Color(0xFFF9FFE5),
                 Appimage.share,
                ),
              ), // Yellowish
              SizedBox(width: 10.w),
              Expanded(
                child: _buildPromoCard(
                  "متجر المكافآت",
                  "تسوق الآن",
                  const Color(0xFFE8FAFC),
                  Appimage.presentShop,
                ),
              ), // Blueish
            ],
          ),
          SizedBox(height: 25.h),

          // --- Services Section ---
          _buildSectionHeader("خدماتي"),
          SizedBox(height: 20.h),
          _buildServicesRow(),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, UserProfile user) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GeneralSettingsScreen(user: user),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: SvgPicture.asset(AppIcons.setting),
              ),
              Text(
                'الاعدادات العامة',
                style: TextStyle(
                  fontFamily: Appstring.fontfamily,
                  fontSize: 10,
                  color: appcolors.black2,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        // Name & Badge
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              user.name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: Appstring.fontfamily,
                color: appcolors.black2,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: appcolors.primarycolor, // Lime green
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                "نقاط النمو : ${user.growthPoints}",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: Appstring.fontfamily,
                  color: Color(0xff283300),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 12.w),
        // Avatar
        CircleAvatar(
          radius: 26.r,
          backgroundColor: appcolors.buttoncoloronboarding, // Dark Teal
          child: Text(
            "ع.ذ",
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsContainer(UserProfile user) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(
            "السلة",
            user.cartItems.toString(),
            AppIcons.bagTick,
          ),
          _buildVerticalLine(),
          _buildStatItem("المفضلة", user.favorites.toString(), AppIcons.heart),
          _buildVerticalLine(),
          _buildStatItem(
            "القسائم",
            user.vouchers.toString(),
            AppIcons.discount,
          ),
          _buildVerticalLine(),
          _buildStatItem("النقاط", user.points.toString(), AppIcons.blend),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, String icon) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: appcolors.buttoncoloronboarding,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4.w),
            SvgPicture.asset(icon, color: appcolors.buttoncoloronboarding),
          ],
        ),
        SizedBox(height: 6.h),
        Text(
          value,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildVerticalLine() =>
      Container(height: 30.h, width: 1, color: Colors.grey.shade200);

  Widget _buildBanner() {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xff06292D), // Dark background
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: appcolors.whicolor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "اشترك الان",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: Appstring.fontfamily,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            "استمتع 1 سنة مجانا من بيزنس إكسبريس",

            style: TextStyle(
              color: Colors.white,
              fontSize: 11.sp,
              fontFamily: Appstring.fontfamily,
            ),
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset(
            AppIcons.sittah,
            width: 25,
            height: 25,
          ), // Placeholder logo
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(MyFlutterApp.arrow_left, size: 20.sp, color: Colors.grey),
            Text(
              "عرض الكل",
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
          ],
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: Appstring.fontfamily,
          ),
        ),
      ],
    );
  }

  Widget _buildOrdersRow() {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildIconBox(AppIcons.cridetcardnotaccepted, "غير مكتمل"),
        _buildIconBox(AppIcons.inPreparation, "قيد المعالجة"),
        _buildIconBox(AppIcons.codesandbox, "تم الشحن"),
        _buildIconBox(AppIcons.motorbike, "تم التوصيل"),
      ],
    );
  }

  Widget _buildServicesRow() {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildImageBox(Appimage.medicine, "الوصفات الطبية"),
        _buildImageBox(Appimage.rating, "التقييمات"),
        _buildImageBox(Appimage.titles, "العناوين"),
        _buildImageBox(Appimage.tickets, "التذاكر"),
      ],
    );
  }

  Widget _buildImageBox(String image, String label) {
    return Column(
      children: [
        Image.asset(image, height: 60, width: 80),

        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildIconBox(String icon, String label) {
    return Column(
      children: [
        SvgPicture.asset(icon),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildPromoCard(
    String title,
    String btnText,
    Color bgColor,
    String image,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      height: 80.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(image),
          SizedBox(width: 5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: appcolors.buttoncoloronboarding,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  btnText,
                  style: TextStyle(
                    color: appcolors.primarycolor,
                    fontSize: 10.sp,
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
