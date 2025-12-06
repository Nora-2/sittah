import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';

void showCustomDialogproduct(BuildContext context) {
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
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.5,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 180.w,
                    height: 100.h,
                    child: Image.asset(Appimage.cardglass),
                  ),

                  SizedBox(height: 14.h),

                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            Appstring.medicalPrescription,
                            style: TextStyle(
                              fontFamily: Appstring.fontfamily,
                              color: appcolors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Text(
                            Appstring.nonMedicalSunglasses,
                            style: TextStyle(
                              fontFamily: Appstring.fontfamily,
                              color: appcolors.graylinethrough,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '00.00 د.ع',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: Appstring.fontfamily,
                          color: appcolors.buttoncoloronboarding,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            Appstring.lens,
                            style: TextStyle(
                              fontFamily: Appstring.fontfamily,
                              color: appcolors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Text(
                            Appstring.darkGrayLens,
                            style: TextStyle(
                              fontFamily: Appstring.fontfamily,
                              color: appcolors.graylinethrough,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        Appstring.lensPrice,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: Appstring.fontfamily,
                          color: appcolors.buttoncoloronboarding,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Directionality(
                    textDirection: TextDirection.ltr,
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
                        horizontal: 4.w,
                        vertical: 4.h,
                      ), // Responsive padding
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Custombutton(
                                  text: Appstring.addToCart,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.framechoose,
                                    );
                                  },
                                  color: appcolors.primarycolor,
                                  backgroundColor:
                                      appcolors.buttoncoloronboarding,
                                  icon: AppIcons.shoppingCart,
                                ),

                                Spacer(),
                                Text(
                                  Appstring.totalPrice,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: Appstring.fontfamily,
                                    color: appcolors.buttoncoloronboarding,
                                  ),
                                ),
                              ],
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
        );
      },
    );
  }
}
