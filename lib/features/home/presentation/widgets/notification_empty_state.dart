import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';

class NotificationEmptyState extends StatelessWidget {
  const NotificationEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Appimage.bell),
            const SizedBox(height: 24),
             Text(
            Appstring.notifiemptytitle ,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: appcolors.black,
                fontFamily: Appstring.fontfamily
              ),
            ),
            const SizedBox(height: 10),
            Text(
            Appstring.notifiemptysubtitle ,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
                height: 1.5,
                fontFamily: Appstring.fontfamily
              ),
            ),
            const SizedBox(height: 30),
            Custombutton(text: Appstring.notifiemptybutton, onPressed: (){},color: appcolors.primarycolor,backgroundColor: appcolors.buttoncoloronboarding,icon: AppIcons.shoppingbag,)
          ],
        ),
      ),
    );
  }
}
