import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/cart/presentation/cubit/cart_cubit.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key,required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ملخص الطلب',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: Appstring.fontfamily,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'رمز الخصم',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: Appstring.fontfamily,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 40.h,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.r),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: 'ادخل كود الخصم',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 32.h,
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        color: appcolors.buttoncoloronboarding,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          'تفعيل',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: appcolors.primarycolor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Points Toggle
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'استخدام النقاط:',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset(AppIcons.blend),
                      Text(
                        ' نقاطي: ',
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                      Text(
                        '${state.pointsUsed}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: appcolors.buttoncoloronboarding,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('استخدام 0 نقطة',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[400],
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text('-00.00 د.ع'),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              Container(
                padding: EdgeInsets.all(4.w),
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.rotate,
                      width: 25.h,
                      height: 25.h,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'توصيل بدون قلق',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                'مقابل ${state.deliveryFee.toStringAsFixed(0)} د.ج سنوياً',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'احصل على استرداد كامل إذا لم يصل الطلب كما هو موصوف، بما في ذلك الفقدان والأضرار أثناء النقل',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Switch(
                      splashRadius: 25.r,
                      activeTrackColor: appcolors.buttoncoloronboarding,
                      value: true,
                      onChanged: (value) {},
                      activeColor: appcolors.whicolor,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Subtotal
              _buildSummaryRow(
                '${state.subtotal.toStringAsFixed(0)} د.ج',
                'المجموع الفرعي:',
                bold: true,
                large: true,
              ),

              SizedBox(height: 6.h),
              Divider(
                height: 1.h,
                color: appcolors.graytestonboard,
                indent: 40,
                endIndent: 40,
              ),
              SizedBox(height: 6.h),
              _buildSummaryRow(
                '${state.total.toStringAsFixed(0)} د.ج',
                'الإجمالي:',
                bold: true,
                large: true,
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.blend,
                    color: appcolors.buttoncoloronboarding,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'تحصيل على 6 نقاط من هذا الطلب',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: appcolors.buttoncoloronboarding,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSummaryRow(
    String value,
    String label, {
    bool bold = false,
    bool large = false,
  }) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: TextStyle(
            color: appcolors.buttoncoloronboarding,
            fontSize: large ? 16.sp : 14.sp,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: large ? 16.sp : 14.sp,
            fontFamily: Appstring.fontfamily,
            fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
            color: bold ? Colors.black : Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
