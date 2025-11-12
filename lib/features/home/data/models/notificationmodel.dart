
class NotificationModel {
  final String title;
  final String time;
  final String icon;

  final bool isRead;
  final bool hasActions;

  NotificationModel({
    required this.title,
    required this.time,
    required this.icon,

    this.isRead = false,
    this.hasActions = false,
  });
}