import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/rewardandpoints/presentation/cubit/copon_state.dart';
import 'package:glasses/features/rewardandpoints/presentation/cubit/copuon_cubit.dart';
import '../widgets/coupon_card.dart';
import '../widgets/product_card.dart';
import '../widgets/coupon_toggle_switch.dart';

class CouponsScreen extends StatefulWidget {
  const CouponsScreen({super.key});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  // 0 = Valid/Unused, 1 = Invalid/Expired
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              appcolors.gradient1,
              appcolors.whicolor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- 1. Header ---
              Container(
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 20.sp),
                      color: appcolors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "متجر المكافآت",
                      style: TextStyle(
                        fontFamily: Appstring.fontfamily,
                        fontSize: 18.sp,
                        color: appcolors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Dummy box to center title
                    SizedBox(width: 40.w),
                  ],
                ),
              ),

              // --- 2. White Content Container (Takes remaining space) ---
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: appcolors.whicolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  // Remove Padding logic involving height * 0.1, use layout properly
                  child: BlocBuilder<StoreCubit, StoreState>(
                    builder: (context, state) {
                      if (state is StoreLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is StoreLoaded) {
                        return Column(
                          children: [
                            SizedBox(height: 20.h),

                            // A. Toggle Switch
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: CouponToggleSwitch(
                                selectedIndex: _selectedIndex,
                                validCount: state.validCoupons.length,
                                invalidCount: state.invalidCoupons.length,
                                onToggle: (index) {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                              ),
                            ),

                            SizedBox(height: 16.h),

                            // B. Content View (Scrollable part)
                            Expanded(
                              child: _selectedIndex == 0
                                  ? _buildValidCouponsView(state)
                                  : _buildExpiredCouponsView(state),
                            ),
                          ],
                        );
                      }
                      return const Center(child: Text("حدث خطأ ما"));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- View 1: Valid Coupons + Suggested Products ---
  Widget _buildValidCouponsView(StoreLoaded state) {
    // SingleChildScrollView works here because parent is Expanded
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // List of Green Coupons
          ...state.validCoupons.map((c) => CouponCard(coupon: c)),

          SizedBox(height: 24.h),

          // "Other products you might like" Section
          Center(
            child: Text(
              "منتجات أخرى قد تثير اهتمامك",
              style: TextStyle(
                fontSize: 14.sp, 
                fontWeight: FontWeight.bold,
                fontFamily: Appstring.fontfamily
              ),
            ),
          ),
          SizedBox(height: 12.h),

          GridView.builder(
            shrinkWrap: true, // Vital for nesting inside SingleChildScrollView
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.62, 
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
            ),
            itemCount: state.products.length > 2 ? 2 : state.products.length,
            itemBuilder: (ctx, index) =>
                ProductCard(product: state.products[index]),
          ),
          SizedBox(height: 30.h), // Bottom padding
        ],
      ),
    );
  }

  // --- View 2: Expired Coupons (With Overlay) ---
  Widget _buildExpiredCouponsView(StoreLoaded state) {
    // We don't need Expanded here because the parent is already Expanded
    // We just return the Stack to fill that space
    return Stack(
      children: [
        // Layer 1: The List
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          itemCount: state.invalidCoupons.length + 1,
          itemBuilder: (context, index) {
            // A. Bottom Text
            if (index == state.invalidCoupons.length) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Text(
                  "فقط القسائم التي انتهت صلاحيتها خلال الأشهر الثلاثة الماضية",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 10.sp,
                    fontFamily: Appstring.fontfamily,
                  ),
                ),
              );
            }

            // B. The Coupon Card
            return CouponCard(coupon: state.invalidCoupons[index]);
          },
        ),

        // Layer 2: The Fog Overlay
        IgnorePointer(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xffF2F2F2).withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}