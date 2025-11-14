import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';

import 'package:glasses/features/authantication/presentation/cubit/authantication_cubit.dart';
import 'package:glasses/features/authantication/presentation/widgets/passwordback.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPasswordScreen extends StatefulWidget {
  const OtpPasswordScreen({super.key});

  @override
  State<OtpPasswordScreen> createState() => _OtpPasswordScreenState();
}

class _OtpPasswordScreenState extends State<OtpPasswordScreen> {
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
    // Start timer when screen loads
    context.read<AuthanticationCubit>().startOtpTimer();
  }

  @override
  void dispose() {
    errorController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<AuthanticationCubit, AuthanticationState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: appcolors.green,
              ),
            );
            // Navigate to next screen if needed
          } else if (state is AuthError) {
            setState(() {
              hasError = true;
            });
            errorController?.add(ErrorAnimationType.shake);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: appcolors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthanticationCubit>();

          return Stack(
            children: [
              // Background
              Passback(
                title: Appstring.otptitle,
                subTitel: Appstring.otpsubTitel,
              ),

              // Scrollable form container
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.23),
                  child: Container(
                    width: double.infinity,
                    height: height * 1.08,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: appcolors.whicolor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.r),
                        topRight: Radius.circular(35.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        SizedBox(height: 10.h),
                        Image.asset(
                          Appimage.otp,
                          height: 120.h,
                          fit: BoxFit.fill,
                        ),

                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            controller: cubit.otpController,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            keyboardType: TextInputType.number,
                            autoFocus: true,
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            animationDuration: const Duration(
                              milliseconds: 300,
                            ),
                            textStyle: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: appcolors.black,
                            ),
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.underline,
                              fieldHeight: 60.h,
                              fieldWidth: 40.w,
                              activeFillColor: appcolors.whicolor,
                              inactiveFillColor: appcolors.whicolor,

                              selectedFillColor: appcolors.whicolor,
                              inactiveColor: Colors.grey.shade300,
                              selectedColor: appcolors.black,
                              errorBorderColor: appcolors.red,
                            ),
                            cursorColor: appcolors.black,
                            onCompleted: (value) {
                              cubit.verifyOtp(value);
                            },
                            onChanged: (value) {
                              setState(() {
                                currentText = value;
                                hasError = false;
                              });
                            },
                            beforeTextPaste: (text) {
                              return text != null &&
                                  text.length == 6 &&
                                  int.tryParse(text) != null;
                            },
                          ),
                        ),

                        if (hasError)
                          Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              Appstring.incorrectcode,
                              style: TextStyle(
                                color: appcolors.red,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),

                        SizedBox(
                          height: 10.h,
                        ), // Added some space after OTP input
                        // Timer and Counter Display (Now after OTP input)
                        BlocBuilder<AuthanticationCubit, AuthanticationState>(
                          builder: (context, state) {
                            double seconds = cubit.secondsRemaining;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  textDirection: TextDirection.rtl,
                                  '  $seconds ثانية',
                                  style: TextStyle(
                                    fontFamily: Appstring.fontfamily,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: appcolors.black,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),

                        SizedBox(height: 12.h),

                        // Resend Button
                        BlocBuilder<AuthanticationCubit, AuthanticationState>(
                          builder: (context, state) {
                            bool canResend = cubit.secondsRemaining == 0;
                            return GestureDetector(
                              onTap: canResend ? cubit.resendOtp : null,
                              child: RichText(
                                text: TextSpan(
                                  text: Appstring.didntrecivecode, // First part
                                  style: TextStyle(
                                    color: appcolors.graylinethrough,
                                    fontSize: 14,
                                    fontFamily: Appstring.fontfamily,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: Appstring.sendcodeagain,
                                      style: TextStyle(
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                        color: appcolors.buttoncoloronboarding,
                                        fontFamily: Appstring.fontfamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 200.h),
                        Custombutton(
                          text: 'ارسال',
                          onPressed: currentText.length == 6
                              ? () {
                                  cubit.verifyOtp(currentText);
                                  Navigator.pushNamed(
                                    context,
                                    Routes.newpassword,
                                  );
                                }
                              : null,
                          icon: AppIcons.educare,
                        ),

                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
