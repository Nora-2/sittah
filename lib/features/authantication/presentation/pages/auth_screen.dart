import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/features/authantication/presentation/cubit/authantication_cubit.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_tabs.dart';
import 'package:glasses/features/authantication/presentation/widgets/authback.dart';
import 'package:glasses/features/authantication/presentation/widgets/signin_form.dart';
import 'package:glasses/features/authantication/presentation/widgets/signup_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
              AuthBackground(islogin: cubit.isLogin),

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
                      children: [
                        AuthTabs(
                          isLogin: cubit.isLogin,
                          onTapLogin: cubit.toggleMode,
                          onTapSignup: cubit.toggleMode,
                        ),
                        SizedBox(height: height * 0.03),

                        // Forms
                        cubit.isLogin
                            ? LoginForm(cubit: cubit)
                            : SignupForm(cubit: cubit),
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
