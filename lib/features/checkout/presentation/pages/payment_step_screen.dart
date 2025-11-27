import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/checkout/data/models/payment_method.dart';
import 'package:glasses/features/checkout/presentation/cubit/checkout_cubit.dart';

class PaymentStepScreen extends StatelessWidget {
  final List<PaymentMethod> paymentMethods = [
   PaymentMethod(
    type: PaymentMethodType.klarna,
    title: Appstring.klarna,
    subtitle: Appstring.fourFreePayments,
  ),
  PaymentMethod(
    type: PaymentMethodType.afterpay,
    title: Appstring.afterpay,
    subtitle: Appstring.fourFreePayments,
  ),
  PaymentMethod(type: PaymentMethodType.paypal, title: Appstring.paypal),
  ];
 final List<PaymentMethod> paymentMethodall = [
  PaymentMethod(
    type: PaymentMethodType.card,
    title: Appstring.creditDebitCard,
  ),
];

  PaymentStepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final paymentState = state as CheckoutPaymentStep;

        return SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             Text(
  Appstring.availablePaymentMethods,
  style: TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    fontFamily: Appstring.fontfamily,
  ),
),
              SizedBox(height: 20.h),
              ...paymentMethodall.map((method) {
                final isSelected =
                    paymentState.paymentMethod?.type == method.type;
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _buildPaymentOption(context, method, isSelected),
                );
              }),
              SizedBox(height: 10.h),
              _buildAddCardButton(),
              SizedBox(height: 10.h),
              ...paymentMethods.map((method) {
                final isSelected =
                    paymentState.paymentMethod?.type == method.type;
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _buildPaymentOption(context, method, isSelected),
                );
              }),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPaymentOption(
    BuildContext context,
    PaymentMethod method,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        context.read<CheckoutCubit>().selectPaymentMethod(method);
      },
      child: method.title == 'PayPal'
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 16.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected
                      ? appcolors.buttoncoloronboarding
                      : Colors.grey[300]!,
                  width: isSelected ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  _buildPaymentIcon(method.type),
                  SizedBox(width: 8.w),
                  Text(
                    method.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Appstring.fontfamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
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
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 16.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected
                      ? appcolors.buttoncoloronboarding
                      : Colors.grey[300]!,
                  width: isSelected ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  _buildPaymentIcon(method.type),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        method.title,
                        style: TextStyle(
                          fontFamily: Appstring.fontfamily,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (method.subtitle != null) ...[
                        SizedBox(height: 4.h),
                        Text(
                          textDirection: TextDirection.rtl,
                          method.subtitle!,
                          style: TextStyle(
                            fontFamily: Appstring.fontfamily,
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ] else ...[
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            SvgPicture.asset(
                            AppIcons.visa,
                              width: 40,
                            ),
                            SizedBox(width: 4.w),
                            SvgPicture.asset(
                              AppIcons.dinerclub,
                              width: 40,
                            ),
                            SizedBox(width: 4.w),
                            SvgPicture.asset(
                             AppIcons.dicover,
                              width: 40,
                            ),
                            SizedBox(width: 4.w),
                            SvgPicture.asset(
                            AppIcons.mastercard,
                              width: 40,
                            ),
                            SizedBox(width: 4.w),
                            SvgPicture.asset(
                              AppIcons.mestero,
                              width: 40,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                  Spacer(),
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
            ),
    );
  }

  Widget _buildPaymentIcon(PaymentMethodType type) {
    switch (type) {
      case PaymentMethodType.card:
        return SvgPicture.asset(AppIcons.property34);
      case PaymentMethodType.klarna:
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xffFEB4C7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            AppIcons.klarnaLogoSvg,
            color: appcolors.black,
          ),
        );
      case PaymentMethodType.afterpay:
        return Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: appcolors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(
                AppIcons.vector,
                width: 12,
                height: 12,
                color: Color(0xffD7FFEB),
              ),
              Text(
                Appstring.afterpay,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffD7FFEB),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      case PaymentMethodType.paypal:
        return SvgPicture.asset(AppIcons.paypal);
    }
  }

  Widget _buildAddCardButton() {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: appcolors.buttoncoloronboarding),
          ),
          child: Icon(
            Icons.add,
            color: appcolors.buttoncoloronboarding,
            size: 18,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
  Appstring.addNewCard,
  style: TextStyle(
    fontSize: 14.sp,
    color: appcolors.graylinethrough,
    fontFamily: Appstring.fontfamily,
    fontWeight: FontWeight.w600,
  ),
),
      ],
    );
  }
}
