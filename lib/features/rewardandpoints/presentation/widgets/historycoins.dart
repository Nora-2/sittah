
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

// Helper color based on the image (Dark Teal)
 Color kTealColor = appcolors.buttoncoloronboarding;
void showCustomDialogcoinshistory(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return const _SizeSelectorSheetcoinshistory();
    },
  );
}

class _SizeSelectorSheetcoinshistory extends StatefulWidget {
  const _SizeSelectorSheetcoinshistory();

  @override
  State<_SizeSelectorSheetcoinshistory> createState() => _SizeSelectorSheetcoinshistoryState();
}

class _SizeSelectorSheetcoinshistoryState extends State<_SizeSelectorSheetcoinshistory> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.40, // Increased height to fit list
      minChildSize: 0.4,
      maxChildSize: 0.85,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
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
            child: Column(
              children: [
                SizedBox(height: 12.h),
                // Grey Handle Bar
                Container(
                  width: 50.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 15.h),
                Expanded(
                  child: _HistoryListBody(scrollController: scrollController), 
                  // child: _HistoryListBody(scrollController: scrollController), 
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HistoryListBody extends StatelessWidget {
  final ScrollController scrollController;
  const _HistoryListBody({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'سجل النقاط',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontFamily: Appstring.fontfamily,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView.separated(
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            itemCount: 3, // Mock count
            separatorBuilder: (c, i) => Divider(height: 30.h, color: Colors.grey[200]),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  // Text Section (Right Side)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'مكافأة من تسجيل الدخول',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: Appstring.fontfamily,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        textDirection: TextDirection.rtl,
                        '11 اكتوبر 2024',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontFamily: Appstring.fontfamily,
                        ),
                      ),
                    ],
                  ),
                  
                  // Points Value (Left Side)
                  Text(
                       textDirection: TextDirection.rtl,
                    '+1 نقطة', // Changed from +10 to match Visual vibe or +60
                    style: TextStyle(
                      
                      color: kTealColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: Appstring.fontfamily,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}