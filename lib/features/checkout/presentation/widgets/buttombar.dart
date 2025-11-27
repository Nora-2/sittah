import 'package:flutter/material.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_button.dart';
import 'package:glasses/features/cart/presentation/widgets/klarna.dart';
import 'package:glasses/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:glasses/features/checkout/presentation/widgets/SeeCart.dart';

class buttom extends StatelessWidget {
  final int currentstep;
  final dynamic onPressed;

  const buttom(
    CheckoutState state, {
    super.key,

    required this.currentstep,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: appcolors.cardBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1.r, // Responsive spread radius
              blurRadius: 10.r, // Responsive blur radius
              offset: Offset(0, -3.h), // Responsive offset
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 12.h,
        ), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Custombutton(
                      text: 'مشاهدة السلة',
                      onPressed: () {
                        showCustomDialogseecart(context);
                      },
                      color: appcolors.black,
                      backgroundColor: appcolors.textGrey.withOpacity(.15),
                      icon: AppIcons.cart,
                    ),
                  ),
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: currentstep == 2
                        ? Custombutton(
                            text: 'ادفع الان',
                            onPressed: () {
                              showCustomDialogpay(context);
                            },
                            color: appcolors.primarycolor,
                            backgroundColor: appcolors.buttoncoloronboarding,
                            icon: AppIcons.moneytick,
                          )
                        : AuthButton(
                            text: Appstring.next,
                            onPressed: onPressed,
                            color: appcolors.primarycolor,
                            backgroundColor: appcolors.buttoncoloronboarding,
                            icon: MyFlutterApp.arrow_left,
                          ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),
            klarna(),
          ],
        ),
      ),
    );
  }
}

void showCustomDialogpay(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return _SizeSelectorSheet();
    },
  );
}

class _SizeSelectorSheet extends StatefulWidget {
  const _SizeSelectorSheet();

  @override
  State<_SizeSelectorSheet> createState() => _SizeSelectorSheetState();
}

class _SizeSelectorSheetState extends State<_SizeSelectorSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.45,
      minChildSize: 0.3,
      maxChildSize: 0.45,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/Order Done.png'),
            ),

            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 140.h),
                  Text(
                    textDirection: TextDirection.rtl,
                    'تمت عملية الشراء بنجاح 🎉',
                    style: TextStyle(
                      fontFamily: Appstring.fontfamily,
                      fontSize: 17.sp,
                      color: appcolors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    'يسعدنا انضمامك لعملائنا المميزين راقب بريدك، \nفالهدايا والعروض الخاصة بانتظارك',
                    style: TextStyle(
                      fontFamily: Appstring.fontfamily,
                      fontSize: 13.sp,
                      color: appcolors.graylinethrough,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Custombutton(
                    text: 'تسوق منتجات اخري',
                    onPressed: () {},
                    color: appcolors.primarycolor,
                    backgroundColor: appcolors.buttoncoloronboarding,
                    icon: AppIcons.shoppingBag,
                  ),
                  SizedBox(height: 6.h),
                  Custombutton(
                    text: 'الذهاب للرئيسية',
                    onPressed: () {},
                    color: appcolors.black,
                    backgroundColor: appcolors.borderColor,
                    icon: AppIcons.home,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
