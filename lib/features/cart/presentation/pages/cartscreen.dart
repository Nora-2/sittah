import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';
import 'package:glasses/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:glasses/features/cart/presentation/widgets/cart_item.dart';
import 'package:glasses/features/cart/presentation/widgets/empty_cart_screen.dart';
import 'package:glasses/features/cart/presentation/widgets/klarna.dart';
import 'package:glasses/features/cart/presentation/widgets/ordersummary.dart';
import 'package:glasses/features/cart/presentation/widgets/sugestedproductcard.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                         Appstring.shoppingCart,
                          style: TextStyle(
                            fontFamily: Appstring.fontfamily,
                            fontSize: 17.sp,
                            color: appcolors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // balance right spacing
                    ],
                  ),
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state.items.isEmpty) {
                      return const EmptyCartWidget();
                    }
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(top: 80.h),
                        child: Container(
                          color: appcolors.whicolor,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Cart Items Header
                              Row(
                                children: [
                                  Text(
                                   Appstring.products,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: appcolors.black2,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    ('( ${state.items.length} )'),
                                    style: TextStyle(
                                      fontSize: 16.sp,

                                      color: appcolors.graylinethrough,
                                      fontFamily: Appstring.fontfamily,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.items.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom:8.0),
                                    child: CartItemWidget(
                                      item: state.items[index],
                                      index: index,
                                    ),
                                  );
                                },
                              ),

                              SizedBox(height: 20.h),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                 Appstring.otherProductsYouMightLike,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              SizedBox(height: 16.h),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: SizedBox(
                                  height: 180.h,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      SizedBox(
                                        width: 180.w, // ← العرض المطلوب للبطاقة
                                        child: const SuggestedProductCard(
                                          name:Appstring.elegance,
                                          price: 5.0,
                                          image: '👓',
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      SizedBox(
                                        width: 180.w,
                                        child: const SuggestedProductCard(
                                          name: Appstring.elegance,
                                          price: 5.0,
                                          image: '👓',
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      SizedBox(
                                        width: 180.w,
                                        child: const SuggestedProductCard(
                                          name: Appstring.elegance,
                                          price: 5.0,
                                          image: '👓',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                               OrderSummaryWidget(color: const Color.fromARGB(157, 242, 242, 242),),

                              SizedBox(height: 20.h),

                              // Checkout Button
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Custombutton(
                                  text:Appstring.completeCheckout ,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.checkout,
                                    );
                                  },
                                  icon: AppIcons.money,
                                  color: appcolors.primarycolor,
                                  backgroundColor:
                                      appcolors.buttoncoloronboarding,
                                ),
                              ),
                              SizedBox(height: 10.h),

                              // Payment Options
                              klarna(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
