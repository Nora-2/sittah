import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
// Adjust imports based on your file structure
import 'package:glasses/features/rewardandpoints/presentation/cubit/copon_state.dart';
import 'package:glasses/features/rewardandpoints/presentation/cubit/copuon_cubit.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows gradient to go behind status bar
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
          child: Column(
            children: [
              // --- 1. Custom Header ---
              Padding(
                padding: EdgeInsets.symmetric( vertical: 10.h),
                child: Row(
                  textDirection: TextDirection.rtl, // Ensure Arabic layout
                  
                  children: [
                    // Back Button
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 20.sp),
                      color: appcolors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    
                    // Title
                    Text(
                      "المفضلة", // "Favorites" or "متجر المكافآت"
                      style: TextStyle(
                        fontFamily: Appstring.fontfamily,
                        fontSize: 18.sp,
                        color: appcolors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Empty SizedBox to balance the Row (centers the title visually)
                    SizedBox(width: 40.w), 
                  ],
                ),
              ),

              // --- 2. White Content Container ---
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: appcolors.whicolor,
                    // Optional: Rounded top corners for "Sheet" look
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: BlocBuilder<StoreCubit, StoreState>(
                    builder: (context, state) {
                      if (state is StoreLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is StoreLoaded) {
                        // Check if empty
                        if (state.products.isEmpty) {
                          return Center(child: Text("لا توجد منتجات مفضلة", style: TextStyle(fontFamily: Appstring.fontfamily)));
                        }

                        // Use GridView directly inside Expanded
                        return GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.62, // Tweak based on your ProductCard height
                            crossAxisSpacing: 12.w,
                            mainAxisSpacing: 12.h,
                          ),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return ProductCard(product: state.products[index]);
                          },
                        );
                      } else if (state is StoreError) {
                        return Center(child: Text("حدث خطأ ما"));
                      }
                      return const SizedBox();
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
}