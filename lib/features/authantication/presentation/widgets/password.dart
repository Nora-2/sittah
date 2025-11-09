import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/authantication/presentation/cubit/authantication_cubit.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_button.dart';
import 'package:glasses/features/authantication/presentation/widgets/passwordback.dart';
import 'package:glasses/features/authantication/presentation/widgets/phoneauthfield.dart';
import 'package:glasses/features/authantication/presentation/widgets/titelformfield.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<AuthanticationCubit, AuthanticationState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthanticationCubit>();

          return Stack(
            children: [
              // Background
              Passback(
                title: Appstring.forgetpasstitel,
                subTitel: Appstring.forgetpasssubtitel,
              ),

              // Scrollable form container
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.23),
                  child: Container(
                    width: double.infinity,
                    height: height * 1.08,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 25,
                    ),
                    decoration: BoxDecoration(
                      color: appcolors.whicolor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.r),
                        topRight: Radius.circular(35.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(child: Image.asset(Appimage.forgetpassword)),
                        SizedBox(height: 10.h),
                        Textheaderformfiled(titel: Appstring.signupPhoneTitle),
                        SizedBox(height: 10.h),
                        Phoneauthwidget(
                          value: cubit.selectedCountry,
                          controller: cubit.phoneController,
                          onchanged: (value) {
                            if (value != null) {
                              cubit.updateCountry(value);
                            }
                          },
                        ),
                        SizedBox(height: 200.h),
                        AuthButton(
                          text: Appstring.next,
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.otp);
                          },
                          icon: MyFlutterApp.arrow_left,
                          color: appcolors.primarycolor,
                          backgroundColor: appcolors.buttoncoloronboarding,
                        ),
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
