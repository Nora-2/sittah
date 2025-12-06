import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

// Helper color based on the image (Dark Teal)
 Color kTealColor = appcolors.buttoncoloronboarding;

void showCustomDialogCollectMore(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return const _SizeSelectorSheet();
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
      initialChildSize: 0.5, // Increased height to fit list
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
                  child: _TasksListBody(scrollController: scrollController), 
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


class _TasksListBody extends StatelessWidget {
  final ScrollController scrollController;
  const _TasksListBody({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    // Data list matching the image
    final List<Map<String, String>> tasks = [
      {'title': 'اشتري منتج اليوم', 'subtitle': '+2 نقطتين مكافأة'},
      {'title': 'رشح التطبيق لزميلك', 'subtitle': '+2 نقطتين مكافأة'},
      {'title': 'تحقق من رقم هاتفك', 'subtitle': '+2 نقطتين مكافأة'},
      {'title': 'تحقق من بريد الالكتروني', 'subtitle': '+2 نقطتين مكافأة'},
    ];

    return Column(
      children: [
        Text(
          'كيفية الحصول علي المزيد',
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
            itemCount: tasks.length,
            separatorBuilder: (c, i) => Divider(height: 30.h, color: Colors.grey[200]),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Directionality ensures Arabic layout (Text right, button left)
                textDirection: TextDirection.rtl, 
                children: [
                  // Text Section (Right Side)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        tasks[index]['title']!,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: Appstring.fontfamily,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        textDirection: TextDirection.rtl,
                        tasks[index]['subtitle']!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontFamily: Appstring.fontfamily,
                        ),
                      ),
                    ],
                  ),
                  
                  // Button Section (Left Side)
                  InkWell(
                    onTap: () {
                      // Handle task action
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: kTealColor, // Dark Teal
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'اكمل المهمة',
                        style: TextStyle(
                          color:appcolors.primarycolor,
                          fontSize: 11.sp,
                          fontFamily: Appstring.fontfamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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

