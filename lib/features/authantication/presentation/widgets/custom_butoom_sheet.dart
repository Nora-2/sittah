import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';


void showCustomDialogapprove(BuildContext context, {
   required String text,
    required VoidCallback onPressed,
    required String dialogTitle,
    required String dialogSubtitle,

    required Widget button,})
    
     {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return  _SizeSelectorSheet(text: text, onPressed:onPressed, dialogSubtitle:dialogSubtitle, dialogTitle: dialogTitle, button: button,);
    },
  );
}

class _SizeSelectorSheet extends StatefulWidget {
  const _SizeSelectorSheet({
    required this.text,
    required this.onPressed,
    required this.dialogSubtitle,
    required this.dialogTitle,

    required this.button,
  });

  final VoidCallback onPressed;
  final String text;

  final String dialogTitle;
  final String dialogSubtitle;
  final Widget button;
  @override
  State<_SizeSelectorSheet> createState() => _SizeSelectorSheetState();
}

class _SizeSelectorSheetState extends State<_SizeSelectorSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 80.w,
                    height: 80.h,
                    child: Image.asset(Appimage.aprove),
                  ),

                  SizedBox(height: 10.h),

                  // Title
                  Text(
                    widget.dialogTitle,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: appcolors.black,
                      fontFamily: Appstring.fontfamily,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 12.h),

                  // Subtitle
                  Text(
                    widget.dialogSubtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Appstring.fontfamily,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 22.h),

                  // Button
                  widget.button,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
