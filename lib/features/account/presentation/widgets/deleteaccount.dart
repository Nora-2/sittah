import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';

void showCustomDialogdelete(BuildContext context) {
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
      initialChildSize: 0.5,
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
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(height: 20.h),

                  Image.asset(Appimage.deleteAccount),
                     SizedBox(height: 10.h),
                  Text(
                    'سنفتقدك بين عملائنا المميزين',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: Appstring.fontfamily,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    textAlign: TextAlign.center,
                    'بحذف حسابك، ستفقد جميع النقاط والهدايا والعروض الخاصة بك',
                    style: TextStyle(
                      fontSize: 14,
                 
                      fontFamily: Appstring.fontfamily,
                      color: appcolors.graylinethrough
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Custombutton(
                    text: 'تراجع',
                    onPressed: () {},
                    icon: AppIcons.backSquare,
                    color: appcolors.whicolor,
                    backgroundColor: appcolors.deleteaccount,
                  ),
                  SizedBox(height: 10.h),
                  Custombutton(
                    text: 'مسح الحساب',
                    onPressed: () {},
                    icon: AppIcons.trash,
                    color: appcolors.black,
                    backgroundColor: appcolors.carshilight,
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
