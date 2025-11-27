import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/checkout/data/models/ShippingMethod.dart';
import 'package:glasses/features/checkout/presentation/cubit/checkout_cubit.dart';

class ShippingStepScreen extends StatelessWidget {
  final List<ShippingMethod> shippingMethods = [
    ShippingMethod(
      id: '1',
      duration: '14-18 يوم',
      description: 'شحن المعتاد',
      price: 5.00,
    ),
    ShippingMethod(
      id: '2',
      duration: '14-7 يوم',
      description: 'شحن متقدم',
      price: 5.50,
      note: '4 أيام أسرع',
    ),
    ShippingMethod(
      id: '3',
      duration: '9-5 يوم',
      description: 'البريد السريع للأعمال',
      price: 6.00,
      note: '',
    ),
  ];

  ShippingStepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final shippingState = state as CheckoutShippingStep;

        return SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'طرق الشحن المتاحة',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: Appstring.fontfamily,
                ),
              ),
              SizedBox(height: 20.h),
              ...shippingMethods.map((method) {
                final isSelected =
                    shippingState.shippingMethod?.id == method.id;
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _buildShippingOption(context, method, isSelected),
                );
              }),
              SizedBox(height: 20.h),
              _buildExpressServiceToggle(
                context,
                shippingState.expressFastService,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShippingOption(
    BuildContext context,
    ShippingMethod method,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        context.read<CheckoutCubit>().selectShippingMethod(method);
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? appcolors.buttoncoloronboarding
                : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  textDirection: TextDirection.rtl,
                  '${method.price.toStringAsFixed(2)} د.ع ',
                  style: TextStyle(
                    fontFamily: Appstring.fontfamily,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: appcolors.buttoncoloronboarding,
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        if (method.note != null)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFD7FFEB).withOpacity(.2),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              textDirection: TextDirection.rtl,
                              method.note!,
                              style: TextStyle(
                                fontFamily: Appstring.fontfamily,
                                fontSize: 10.sp,
                                color: Color(0xff11A75C),
                              ),
                            ),
                          ),
                        SizedBox(width: 8.w),
                        Text(
                          method.duration,
                          style: TextStyle(
                            fontFamily: Appstring.fontfamily,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      method.description,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12.w),
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? appcolors.buttoncoloronboarding
                          : Colors.grey[400]!,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 12.w,
                            height: 12.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: appcolors.buttoncoloronboarding,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
            if (method.id == '3' && method.note != null) ...[
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16.sp,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'يرجى كتابة عنوانك الفعلي، حيث لا يمكن تسليم الطُّرود إلى صناديق بريد',

                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildExpressServiceToggle(BuildContext context, bool isEnabled) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: appcolors.borderColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Switch(
            splashRadius: 30,
            value: isEnabled,
            onChanged: (value) {
              context.read<CheckoutCubit>().toggleExpressService(value);
            },
            trackOutlineWidth: WidgetStateProperty.resolveWith<double?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return 5.0;
              }
              return 1; // Use the default width.
            }),
            trackOutlineColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return appcolors.transcolor;
              }
              return Colors.grey.withOpacity(.2);
            }),
            thumbColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return appcolors.transcolor;
              }
              return Colors.white;
            }),
            trackColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return appcolors.transcolor;
              }
              return Colors.grey.withOpacity(.2);
            }),
            activeColor: appcolors.buttoncoloronboarding,
          ),

          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'خدمة الأعمال السريعة',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: Appstring.fontfamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                RichText(
                                text: TextSpan(
                                  text: 'مقابل',
                                  style: TextStyle(
                                    color: appcolors.black2,
                                    fontSize: 13,
                                    fontFamily: Appstring.fontfamily,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:'29.80 د.ع ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: appcolors.buttoncoloronboarding,
                                        fontFamily: Appstring.fontfamily,
                                      ),
                                    ),
                                    TextSpan(
                                  text: 'سنويًا',
                                  style: TextStyle(
                                    color: appcolors.black2,
                                    fontSize: 13,
                                    fontFamily: Appstring.fontfamily,
                                  ),)
                                  ],
                                ),
                              ),
                Text(
                  'قبل تعبئتي قد تستمتع بسنة محاسبية عند الشراء بالنصر 29د.ج',
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
