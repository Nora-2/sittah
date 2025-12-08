import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/home/presentation/widgets/filter.dart';
import 'package:glasses/features/rewardandpoints/data/models/productreward.dart';
import 'package:glasses/features/rewardandpoints/presentation/cubit/rewardandpoints_cubit.dart';
import 'package:glasses/features/rewardandpoints/presentation/cubit/rewardandpoints_state.dart';
import 'package:glasses/features/rewardandpoints/presentation/widgets/dialy_checkin.dart';
import 'package:glasses/features/rewardandpoints/presentation/widgets/historycoins.dart';
import 'package:glasses/features/rewardandpoints/presentation/widgets/sucsesspopup.dart';
import 'package:glasses/features/rewardandpoints/presentation/widgets/tasks_points.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => RewardCubit()..fetchRewardsData(),
      child: Directionality(
        textDirection: TextDirection.rtl,

        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  appcolors.gradient1,
                  // appcolors.gradient2,
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
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    alignment: Alignment.center,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios, size: 18.sp),
                          color: appcolors.black,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          "متجر المكافآت",
                          style: TextStyle(
                            fontFamily: Appstring.fontfamily,
                            fontSize: 17.sp,
                            color: appcolors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          AppIcons.questionMark,
                          width: 15.w,
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.1),
                      child: Container(
                        width: double.infinity,
                        height: height * 1.25,
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        decoration: BoxDecoration(color: appcolors.whicolor),
                        child: Column(
                          children: [
                            BlocConsumer<RewardCubit, RewardState>(
                              listener: (context, state) {
                                if (state is RewardLoaded &&
                                    state.showSuccessPopup) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) => const SuccessPopup(),
                                  ).then((_) {
                                    // When dialog closes, update state so it doesn't pop up again
                                    context.read<RewardCubit>().dismissPopup();
                                  });
                                }
                              },
                              builder: (context, state) {
                                if (state is! RewardLoaded) {
                                  return  Center(
                                    child: CircularProgressIndicator(
                                      color:appcolors.buttoncoloronboarding,
                                    ),
                                  );
                                }

                                return SingleChildScrollView(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 10.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildPointsCard(context, state.points),
                                      SizedBox(height: 20.h),
                                      DailyCheckInScrollableWidget(),
                                      SizedBox(height: 20.h),
                                      Row(
                                        children: [
                                          Text(
                                            "منتجات يمكنك استبدالها",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () async {
                                              // ignore: unused_local_variable
                                              final result =
                                                  await GlassesFilterSheet.show(
                                                    context,
                                                  );
                                            },
                                            child: Icon(
                                              MyFlutterApp
                                                  .filter_horizontal__3_,
                                              color: appcolors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.834,
                                              crossAxisSpacing: 12.w,
                                              mainAxisSpacing: 12.h,
                                            ),
                                        itemCount: state.products.length,
                                        itemBuilder: (ctx, index) =>
                                            _buildProductCard(
                                              state.products[index],context
                                            ),
                                      ),
                                      SizedBox(height: 30.h),
                                    ],
                                  ),
                                );
                              },
                            ),
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
      ),
    );
  }

  Widget _buildPointsCard(BuildContext context, int points) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            image: const DecorationImage(
              image: AssetImage(Appimage.rewardback),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Text(
                "$points نقاط",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: [
                  SvgPicture.asset(
                    AppIcons.coin,
                    width: 50.w,
                    height: 60.h,
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "سعر صرف الطلب 10 نقاط = 1 د.ع",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: appcolors.reward,
                        ),
                      ),
                      Text(
                        "سعر صرف في متجر المكافآت 5 نقاط = 1 د.ع",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: appcolors.reward,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  showCustomDialogCollectMore(context);
                },
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      "كيفية الحصول على المزيد",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                      color: appcolors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10.h,
          left: 8.w,
          child: GestureDetector(
            onTap: () {
              showCustomDialogcoinshistory(context);
            },
            child: Row(
              textDirection: TextDirection.ltr,
              children: [
                Icon(Icons.list, size: 16.sp, color: appcolors.whicolor),
                SizedBox(width: 5.w),
                Text(
                  'السجل سابقا',
                  style: TextStyle(fontSize: 12.sp, color: appcolors.whicolor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Product product, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(Appimage.cardglass),
          ),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),

                  SizedBox(height: 4.h),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.productdetailesscreen,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appcolors.buttoncoloronboarding,
                      foregroundColor: Colors.white,

                      padding: EdgeInsets.only(
                        top: 4.h,
                        bottom: 4.h,
                        left: 16.w,
                        right: 16.w,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "استبدل",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: appcolors.primarycolor,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${product.pointsCost} نقاط",
                    style: TextStyle(
                      color: appcolors.pointcost,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Icon(Icons.add, color: Colors.grey, size: 16.sp),
                  SizedBox(height: 4.h),
                  Text(
                    "5 د.ع",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
