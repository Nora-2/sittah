import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/appicons_icons.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';
import 'package:glasses/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:glasses/features/authantication/presentation/cubit/authantication_cubit.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_button.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_textfield.dart';
import 'package:glasses/features/authantication/presentation/widgets/custom_butoom_sheet.dart';
import 'package:glasses/features/authantication/presentation/widgets/passwordback.dart';
import 'package:glasses/features/authantication/presentation/widgets/titelformfield.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
                title: Appstring.enterNewPasswordTitle,
                subTitel: Appstring.createEasyPasswordSubtitle,
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
                        Center(child: Image.asset(Appimage.resetpassword)),
                        SizedBox(height: 10.h),
                        Textheaderformfiled(titel: Appstring.newPasswordLabel),
                        sized.s10,
                        AuthTextField(
                          controller: cubit.passwordController,
                          hint: Appstring.newPasswordHint,
                          icon: Appicons.input_prefix,
                          iconsuffix: Appicons.input_suffix,
                          isPassword: true,
                          validator: (v) => (v == null || v.length < 6)
                              ? Appstring.passwordShortError
                              : null,
                        ),
                        SizedBox(height: 20.h),
                        Textheaderformfiled(
                          titel: Appstring.confirmPasswordLabel,
                        ),
                        sized.s10,
                        AuthTextField(
                          controller: cubit.newpasswordController,
                          hint: Appstring.confirmPasswordHint,
                          icon: Appicons.input_prefix,
                          iconsuffix: Appicons.input_suffix,
                          isPassword: true,
                          validator: (v) => (v == null || v.length < 6)
                              ? Appstring.passwordShortError
                              : null,
                        ),
                        SizedBox(height: 20.h),
                        Custombutton(
                          color: appcolors.primarycolor,
                  backgroundColor: appcolors.buttoncoloronboarding,
                          text: Appstring.saveButton,
                          onPressed: () {
                            PasswordSuccessDialog.show(
                              context: context,
                              text: Appstring.login,
                              onPressed: () {
                                Navigator.of(context).pop();

                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.auth,
                                );
                              },
                              dialogTitle:
                                  Appstring.passwordSavedSuccessfullyTitle,
                              dialogSubtitle:
                                  Appstring.passwordSavedSuccessfullySubtitle,
                              button: AuthButton(
                                icon: Appicons.user,
                                text: Appstring.login,
                                onPressed: () {
                                  Navigator.of(context).pop();

                                  Navigator.pushReplacementNamed(
                                    context,
                                    Routes.auth,
                                  );
                                },
                                color: appcolors.primarycolor,
                                backgroundColor:
                                    appcolors.buttoncoloronboarding,
                              ),
                            );
                          },
                          icon: AppIcons.archivetick,
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
