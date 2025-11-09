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
import 'package:glasses/features/authantication/presentation/widgets/custom_butoom_sheet.dart';
import 'package:glasses/features/authantication/presentation/widgets/gender_selection.dart';
import 'package:glasses/features/authantication/presentation/widgets/phoneauthfield.dart';
import 'package:glasses/features/authantication/presentation/widgets/titelformfield.dart';

class SignupForm extends StatefulWidget {
  final AuthanticationCubit cubit;
  const SignupForm({required this.cubit, super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          
          Textheaderformfiled(titel: Appstring.signupEmailTitle),
          sized.s10,
          AuthTextField(
            controller: widget.cubit.emailController,
            hint: Appstring.signupEmailHint,
            iconsuffix: Appicons.sms_tracking,
            type: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty)
                return Appstring.signupEmailEmptyError;
              if (!v.contains('@')) return Appstring.signupEmailInvalidError;
              return null;
            },
          ),

          SizedBox(height: 15.h),

          Textheaderformfiled(titel: Appstring.signupPhoneTitle),
          sized.s10,
          Phoneauthwidget(
            value: widget.cubit.selectedCountry,
            controller: widget.cubit.phoneController,
            onchanged: (value) {
              if (value != null) {
                widget.cubit.updateCountry(value);
              }
            },
          ),

          SizedBox(height: 15.h),

          Textheaderformfiled(titel: Appstring.signupPasswordTitle),
          sized.s10,
          AuthTextField(
            controller: widget.cubit.passwordController,
            hint: Appstring.signupPasswordHint,
            icon: Appicons.input_prefix,
            iconsuffix: Appicons.input_suffix,
            isPassword: true,
            validator: (v) => (v == null || v.length < 6)
                ? Appstring.signupPasswordShortError
                : null,
          ),

          SizedBox(height: 15.h),

          Textheaderformfiled(titel: Appstring.signupBirthDateTitle),
          sized.s10,
          AuthTextField(
            controller: widget.cubit.dateController,
            hint: Appstring.signupBirthDateHint,
            iconsuffix: Appicons.input_suffix__1_,
            icon: Icons.keyboard_arrow_down,
          ),

          SizedBox(height: 15.h),

          Textheaderformfiled(titel: Appstring.signupGenderTitle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenderRadioOption(
                value: Gender.female,
                groupValue: _selectedGender,
                label: Appstring.genderFemale,
                icon: Appicons.semi_solid_x5f_transparent,
                onChanged: (Gender? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              SizedBox(width: 40.w),
              GenderRadioOption(
                value: Gender.male,
                groupValue: _selectedGender,
                label: Appstring.genderMale,
                icon: Appicons.people_15675806_1,
                onChanged: (Gender? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
            ],
          ),

          SizedBox(height: 20.h),

          /// 🧾 Signup Button
          AuthButton(
            text: Appstring.signupButton,
            onPressed: () {
              widget.cubit.submitForm;

              PasswordSuccessDialog.show(
                context: context,
                text: Appstring.signupconfirmatbuttontitle,
                onPressed: () {
                  Navigator.of(context).pop();

                  Navigator.pushReplacementNamed(context, Routes.auth);
                },
                dialogTitle: Appstring.signupconfirmationtitle,
                dialogSubtitle: Appstring.signupconfirmationsubtitle,
                icon: MyFlutterApp.shopping_cart_check_02,
              );
            },
            icon: MyFlutterApp.user_add,
            color: appcolors.primarycolor,
            backgroundColor: appcolors.buttoncoloronboarding,
          ),

          SizedBox(height: 10.h),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.layout);
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

          SizedBox(height: 8.h),

          Text(
            Appstring.signupAgreement,
            style: TextStyle(
              fontFamily: Appstring.fontfamily,
              fontSize: 10,
              color: appcolors.graylinethrough,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
