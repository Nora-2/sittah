import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/appicons_icons.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';
import 'package:glasses/features/account/presentation/widgets/passcontroller.dart';
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                appcolors.gradient1,
                appcolors.whicolor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                // ---------------- HEADER ----------------
                Container(
                  height: 100.h,
                  alignment: Alignment.center,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios, size: 18.sp),
                        color: appcolors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                      'تغيير الرقم السري',
                        style: TextStyle(
                          fontFamily: Appstring.fontfamily,
                          fontSize: 17.sp,
                          color: appcolors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // ---------------- CARD AREA ----------------
                Padding(
                  padding: EdgeInsets.only(top: height * 0.10),
                  child: Container(
                    width: double.infinity,
                    height: height * 1.08,
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
                    decoration: BoxDecoration(color: appcolors.whicolor),
                    child: Column(
                      children: [
                        // ------------ PASSWORD FIELDS ------------
                        BlocBuilder<ChangePasswordCubit, PasswordState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                _buildPasswordField(
                                  label: "كلمة المرور الحالية",
                                  hint: "ادخل كلمة المرور الحالية",
                                  isVisible: state.isCurrentVisible,
                                  onToggle: () => context.read<ChangePasswordCubit>().toggleCurrentVisibility(),
                                ),
                                SizedBox(height: 20.h),

                                _buildPasswordField(
                                  label: "كلمة المرور الجديدة",
                                  hint: "ادخل كلمة المرور الجديدة",
                                  isVisible: state.isNewVisible,
                                  onToggle: () => context.read<ChangePasswordCubit>().toggleNewVisibility(),
                                ),
                                SizedBox(height: 20.h),

                                _buildPasswordField(
                                  label: "تأكيد كلمة المرور",
                                  hint: "ادخل كلمة المرور الجديدة مرة اخرى",
                                  isVisible: state.isConfirmVisible,
                                  onToggle: () => context.read<ChangePasswordCubit>().toggleConfirmVisibility(),
                                ),
                              ],
                            );
                          },
                        ),

                        const Spacer(),
Custombutton(text: 'تغيير كلمة المرور', onPressed: (){}, icon: AppIcons.passwordCheck,color:appcolors.primarycolor,backgroundColor: appcolors.buttoncoloronboarding,),
    
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String hint,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // RTL Label
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF555555)),
        ),
        SizedBox(height: 8.h),
        TextField(
          textAlign: TextAlign.right, // RTL Input
          obscureText: !isVisible,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12.sp),
            contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
             focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: appcolors.buttoncoloronboarding),
            ),
            // In RTL: Suffix is Left, Prefix is Right
            prefixIcon: IconButton(
              icon: Icon(isVisible ? Appicons.input_prefix: Icons.visibility_off_outlined, color: Colors.grey),
              onPressed: onToggle,
            ),
            suffixIcon: const Icon( Appicons.input_suffix, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}



