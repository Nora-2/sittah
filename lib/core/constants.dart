import 'package:flutter/material.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/appicons_icons.dart';
import 'package:glasses/features/home/data/models/notificationmodel.dart';


abstract class Constants {
     static final categories = [
      {'name': Appstring.category1, 'icon': Appimage.glass1},
      {'name': Appstring.category1, 'icon': Appimage.glass1},
      {'name': Appstring.category2, 'icon': Appimage.glass2},

      {'name': Appstring.category4, 'icon': Appimage.glass3},
      {'name': Appstring.category1, 'icon': Appimage.glass1},
      {'name': Appstring.category1, 'icon': Appimage.glass1},
      {'name': Appstring.category2, 'icon': Appimage.glass2},

      {'name': Appstring.category4, 'icon': Appimage.glass3},
      {'name': Appstring.category1, 'icon': Appimage.glass1},
      {'name': Appstring.category1, 'icon': Appimage.glass1},
      {'name': Appstring.category2, 'icon': Appimage.glass2},

      {'name': Appstring.category4, 'icon': Appimage.glass3},
      {'name': Appstring.category1, 'icon': Appimage.glass1},
      {'name': Appstring.category1, 'icon': Appimage.glass1},
      {'name': Appstring.category2, 'icon': Appimage.glass2},

      {'name': Appstring.category4, 'icon': Appimage.glass3},
      {'name': Appstring.category1, 'icon': Appimage.glass1},
      {'name': Appstring.category1, 'icon': Appimage.glass1},
      {'name': Appstring.category2, 'icon': Appimage.glass2},

      {'name': Appstring.category4, 'icon': Appimage.glass3},
    ];
  static final List<NotificationModel> notifications = [
    NotificationModel(
      title: 'نظاراتك المفضلة عليها خصم 30٪ النهارده بس!',
      time: 'منذ 4 دقائق',
      icon: AppIcons.receiptdiscount,
  
    ),
    NotificationModel(
      title: 'خصم إضافي عند استخدام الكود: VISION10',
      time: 'منذ 3 ساعات',
      icon:  AppIcons.hotprice,
 
    ),
    NotificationModel(
      title: 'طلبك في الطريق إليك 🚚',
      time: 'منذ 1 يوم',
      icon:  AppIcons.deliverytracking,
    
    ),
    NotificationModel(
      title: 'عدسات جديدة مضادة للانعكاس متوفرة الآن 🔍',
      time: 'منذ 1 يوم',
      icon:  AppIcons.glasses,

    ),
    NotificationModel(
      title: 'تم إلغاء الطلب بناءً على طلبك. نأمل نراك قريبًا ❤️',
      time: 'منذ 1 يوم',
      icon: AppIcons.closE,
 
      hasActions: true,
    ),
    NotificationModel(
      title: 'العرض اللي مستنيه رجع 🔥 ما تضيعش الفرصة',
      time: 'منذ 1 يوم',
      icon:  AppIcons.layer,
   
    ),
  ];
   static final Map<String, List<String>> selectedFilters = {
    'type': [],
    'size': [],
    'material': [],
    'frame': [],
    'features': [],
  };

 static List<Color> selectedColors = [];
 static RangeValues priceRange = const RangeValues(200, 2000);

  static final Map<String, List<String>> filterCategories = {
    'type': ['رجالي', 'نسائي'],
    'size': ['صغير', 'متوسط', 'كبير', 'كبير جدًا'],
    'material': [
      'أسيتات',
      'بلاستيك',
      'معدن',
      'تيتانيوم',
      'خشب',
      'نايلون',
      'مختلطة',
      'TR90',
    ],
    'frame': [
      'الطيار',
      'دائري',
      'بيضاوي',
      'هندسي',
      'المستطيل',
      'فراشة',
      'الحاجب',
      'مربع',
    ],
    'features': [
      'رؤية أحادية',
      'نظارات أحادية',
      'غير موصوف',
      'تقدمي',
      'نظارات شمسية طبية',
      'نظارات شمسية غير طبية',
    ],
  };

  static final List<Color> colors = [
    Colors.black,
    Colors.brown,
    Colors.blue,
    Colors.lightBlueAccent,
    Colors.cyan,
    Colors.green,
    Colors.lightGreenAccent,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.pinkAccent,
    Colors.purple,
    Colors.lime,
    Colors.teal,
  ];
}
