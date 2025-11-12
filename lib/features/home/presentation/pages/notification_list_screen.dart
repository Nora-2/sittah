import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/constants.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/home/presentation/widgets/notification_search_bar.dart';
import 'package:glasses/features/home/presentation/widgets/notification_tab_bar.dart';
import 'package:glasses/features/home/presentation/widgets/notification_section_header.dart';
import 'package:glasses/features/home/presentation/widgets/notification_item.dart';
import 'package:glasses/features/home/presentation/widgets/notification_empty_state.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotifications = Constants.notifications.isNotEmpty;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                appcolors.gradient1,
                appcolors.gradient2,
                appcolors.whicolor,
                appcolors.whicolor,
                appcolors.whicolor,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70.h), // below header
                  child: Container(
                    color: appcolors.whicolor,
                    child: Column(
                      children: [
                        const NotificationSearchBar(),
                        NotificationTabBar(
                          selectedIndex: selectedTab,
                          onTabSelected: (i) => setState(() => selectedTab = i),
                        ),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: hasNotifications
                              ? _buildNotificationList()
                              : const NotificationEmptyState(),
                        ),
                      ],
                    ),
                  ),
                ),

         
                Container(
                  height: 100.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, size: 18.sp),
                        color: appcolors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      Expanded(
                        child: Text(
                        Appstring.notifications,
                          style: TextStyle(
                            fontFamily: Appstring.fontfamily,
                            fontSize: 17.sp,
                            color: appcolors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 48.w), // balance right spacing
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      children: [
        const NotificationSectionHeader(title:Appstring.today),
        ...Constants.notifications
            .take(2)
            .expand(
              (n) => [
                Dismissible(
                  key: ValueKey(n.title),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child:  Icon(
                      Icons.delete_outline,
                      color: appcolors.red,
                      size: 24.sp,
                    ),
                  ),
                  onDismissed: (_) {
                    setState(() => Constants.notifications.remove(n));
                  },
                  child: NotificationItem(notification: n, onDelete: () {}),
                ),
                Divider(
                  height: 16.h,
                  thickness: 0.8,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
        const NotificationSectionHeader(title:Appstring.yesterday),
        ...Constants.notifications
            .skip(2)
            .expand(
              (n) => [
                Dismissible(
                  key: ValueKey(n.title),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child:  Icon(
                      Icons.delete_outline,
                      color: appcolors.red,
                      size: 24,
                    ),
                  ),
                  onDismissed: (_) {
                    setState(() => Constants.notifications.remove(n));
                  },
                  child: NotificationItem(notification: n, onDelete: () {}),
                ),
                Divider(
                  height: 16.h,
                  thickness: 0.8,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
      ],
    );
  }
}
