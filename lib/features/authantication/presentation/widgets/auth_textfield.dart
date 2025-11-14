import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final IconData? iconsuffix;
  final bool isPassword;
  final TextInputType type;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.icon,
    this.iconsuffix,
    this.isPassword = false,
    this.type = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.end,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      obscureText: isPassword,

      keyboardType: type,
      validator: validator,
      cursorColor: appcolors.buttoncoloronboarding,
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(icon, color: appcolors.graylinethrough)
            : null,
        hintText: hint,
        hintStyle: TextStyle(color: appcolors.graylinethrough),
        suffixIcon: iconsuffix != null
            ? Icon(iconsuffix, color: appcolors.graylinethrough)
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: appcolors.textfieldborder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: appcolors.buttoncoloronboarding,
            width: 1,
          ),
        ),
      ),
    );
  }
}
