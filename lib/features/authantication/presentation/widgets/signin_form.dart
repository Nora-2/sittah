import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/appicons_icons.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:glasses/features/authantication/presentation/cubit/authantication_cubit.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_button.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_textfield.dart';
import 'package:glasses/features/authantication/presentation/widgets/titelformfield.dart';

/// Login Form Widget
class LoginForm extends StatefulWidget {
  final AuthanticationCubit cubit;
  const LoginForm({required this.cubit, super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Textheaderformfiled(titel: Appstring.emailOrPhoneHint),
          sized.s10,
          AuthTextField(
            controller: widget.cubit.emailController,
            hint: Appstring.emailOrPhoneHint,

            type: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty) return Appstring.emailEmptyError;
              if (!v.contains('@')) return Appstring.emailInvalidError;
              return null;
            },
          ),
          SizedBox(height: 15.h),
          Textheaderformfiled(titel: Appstring.passwordTitle),
          sized.s10,
          AuthTextField(
            controller: widget.cubit.passwordController,
            hint: Appstring.passwordHint,
            icon: Appicons.input_prefix,
            iconsuffix: Appicons.input_suffix,
            isPassword: true,
            validator: (v) => (v == null || v.length < 6)
                ? Appstring.passwordShortError
                : null,
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
            ), // Add some horizontal padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                // "Remember Me" Checkbox
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _rememberMe = newValue!;
                        });
                        // You can save this state to shared preferences or a cubit here
                      },
                      activeColor: Theme.of(
                        context,
                      ).primaryColor, // Or a custom color
                      side: BorderSide(
                        color: Colors.grey[400]!,
                      ), // Light grey border
                    ),
                    Text(
                      Appstring.rememberMe,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: appcolors.black2,
                        fontFamily: Appstring.fontfamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // "Forgot Password?" Link
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.passwordforget);
                  },
                  child: Text(
                    Appstring.forgotPassword,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: appcolors.black,
                      fontFamily:
                          Appstring.fontfamily, // Darker color as in the image
                      decoration:
                          TextDecoration.underline, // Underline as in the image
                      fontWeight: FontWeight.w700, // Bold as in the image
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 130.h),
          AuthButton(
            text: Appstring.login,
            onPressed: widget.cubit.submitForm,
            icon: Appicons.user,
            color: appcolors.primarycolor,
            backgroundColor: appcolors.buttoncoloronboarding,
          ),
          SizedBox(height: 10.h),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.layoutgust);
            },
            child: Container(
              decoration: BoxDecoration(
                color: appcolors.transcolor,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: appcolors.whicolor, width: 1),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    MyFlutterApp.user_tag,
                    color: appcolors.black2,
                    size: 20.w,
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    Appstring.loginasGuest,
                    style: TextStyle(
                      color: appcolors.black2,
                      fontSize: 14.sp,
                      fontFamily: Appstring.fontfamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
