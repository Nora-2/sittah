import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class NotificationSearchBar extends StatelessWidget {
  const NotificationSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
         
            hintStyle: TextStyle(color: appcolors.graylinethrough),
      
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
              
              25.r
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(
              
              25.r
              ),
              borderSide: BorderSide(
                color: appcolors.textfieldborder,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(
              
              25.r
              ),
              borderSide: BorderSide(
                color: appcolors.buttoncoloronboarding,
                width: 1,
              ),
            ),
          
          hintText: Appstring.searchfornotifi,
      
          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
       
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
