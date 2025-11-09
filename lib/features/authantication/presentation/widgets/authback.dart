import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_header.dart';

// ignore: must_be_immutable
class AuthBackground extends StatelessWidget {
   AuthBackground({super.key,required this.islogin});
bool islogin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        gradient:    LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
           appcolors.gradientauth1,
           appcolors.gradientauth2
       
          ],)
      ),
      child:  AuthHeader(islogin:islogin),
    );
  }
}
