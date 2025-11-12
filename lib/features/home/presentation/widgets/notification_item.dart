import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/features/home/data/models/notificationmodel.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onDelete;

  const NotificationItem({
    super.key,
    required this.notification,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(notification.title + notification.time),
      direction: DismissDirection.startToEnd,
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFEBEE),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:  SvgPicture.asset( AppIcons.trash,)
      ),
      onDismissed: (_) {
        onDelete?.call();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('تم حذف الإشعار'),
            backgroundColor: Colors.red[400],
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Icon container
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
             gradient: LinearGradient(colors: [appcolors.gradient1,appcolors.gradient3]),
              borderRadius: BorderRadius.circular(25),
            ),
            child: SvgPicture.asset(notification.icon,   height: 24,width: 24,)
          ),
          const SizedBox(width: 12),
          // 🔹 Notification content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration:  BoxDecoration(
                        color: appcolors.buttoncoloronboarding,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        notification.title,
                        style:  TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: appcolors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  notification.time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }

}
