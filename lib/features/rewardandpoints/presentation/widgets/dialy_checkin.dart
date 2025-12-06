import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyCheckInScrollableWidget extends StatelessWidget {
  const DailyCheckInScrollableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Logic: Day 3 is today (Active). Days 0-2 are past. Days 4+ are future.
    final int currentDayIndex = 2; 
    
    // Generating 14 days of data for the scroll demo
    final List<int> points = List.generate(14, (index) {
       // Just a pattern: 1, 1, 2, 3... repeating
       return (index % 4) + 1; 
    });

    return Directionality(
      textDirection: TextDirection.rtl, // Ensures scroll starts from Right
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20.h), // Removed horizontal padding from main container
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9), // Light grey bg
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header Section (Fixed, does not scroll) ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "التسجيل اليومي",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Colors.black87,
                    ),
                  ),
                  
                  // Remind Me Toggle
                  Row(
                    children: [
                      Text(
                        "قم بتذكيري",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                        height: 24.h,
                        child: Switch(
                          value: false, 
                          onChanged: (v) {},
                          activeColor: const Color(0xFF0F3C46),
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20.h),

            // --- Scrollable Days Section ---
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(), // Nice bounce effect
              padding: EdgeInsets.symmetric(horizontal: 12.w), // Padding at start/end of scroll
              child: Row(
                children: List.generate(points.length, (index) {
                  // Determine State
                  bool isPast = index < currentDayIndex;
                  bool isToday = index == currentDayIndex;
                  bool isFuture = index > currentDayIndex;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w), // Gap between cards
                    child: _buildDayCard(
                      dayNumber: index + 1,
                      amount: points[index],
                      isPast: isPast,
                      isToday: isToday,
                      isFuture: isFuture,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayCard({
    required int dayNumber,
    required int amount,
    required bool isPast,
    required bool isToday,
    required bool isFuture,
  }) {
    // Colors
    final Color activeBgColor = const Color(0xFFD6F55D); // Lime Green
    final Color defaultBgColor = Colors.white;
    final Color darkTextColor = const Color(0xFF0F3C46);
    
    return Container(
      width: 55.w, // Wider card since it scrolls
      height: 75.h,
      decoration: BoxDecoration(
        color: isToday ? activeBgColor : defaultBgColor,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: isToday
            ? [
                BoxShadow(
                  color: activeBgColor.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "+$amount",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: isPast ? Colors.grey : darkTextColor,
            ),
          ),
          SizedBox(height: 8.h),
          
          // Icon Logic
          if (isToday)
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: darkTextColor,
              ),
              child: Icon(Icons.check, color: activeBgColor, size: 14.sp),
            )
          else if (isPast)
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 14.sp),
            )
          else
            // Logo / Icon for future
            Container(
               width: 20.w,
               height: 20.w,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 border: Border.all(color: Colors.grey.shade300, width: 1.5),
               ),
               // Replace with Image.asset if needed
               child: Icon(Icons.token, size: 12.sp, color: Colors.grey),
            ),
        ],
      ),
    );
  }
}