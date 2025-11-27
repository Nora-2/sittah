import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:glasses/features/checkout/presentation/pages/address_step_screen.dart';
import 'package:glasses/features/checkout/presentation/pages/payment_step_screen.dart';
import 'package:glasses/features/checkout/presentation/pages/shipping_step_screen.dart';
import 'package:glasses/features/checkout/presentation/widgets/buttombar.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // Create a GlobalKey for AddressStepScreen
  final GlobalKey<AddressStepScreenState> _addressKey = GlobalKey<AddressStepScreenState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.whicolor,
      body: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 18.sp),
                      color: appcolors.black,
                      onPressed: () {
                        final cubit = context.read<CheckoutCubit>();
                        if (cubit.state.currentStep > 0) {
                          cubit.goBack();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                    ),
                    Text(
                      'رجوع',
                      style: TextStyle(
                        fontFamily: Appstring.fontfamily,
                        fontSize: 17.sp,
                        color: appcolors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                _buildProgressBar(state.currentStep),
                Expanded(child: _buildCurrentStep(context, state)),
                buttom(
                  state,
                  currentstep: state.currentStep,
                  onPressed: () {
                   
                    
                    if (state is CheckoutAddressStep) {
                      final formState = _addressKey.currentState;
                      
                      if (formState == null) {
                      
                        return;
                      }
              
                      
                      // Validate first
                      if (!formState.validateFields(context)) {
                       
                        return;
                      }
                      
                     
                      
                      // Save to cubit
                      formState.saveAddressToCubit();
                      
                      // Wait for next frame
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        final updatedState = context.read<CheckoutCubit>().state;
                        _handleNextStep(context, updatedState);
                      });
                    } else {
                      _handleNextStep(context, state);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProgressBar(int currentStep) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                _buildStepCircle(step: 0, currentStep: currentStep),
                Expanded(child: _buildStepLine(isActive: currentStep >= 0)),
                _buildStepCircle(step: 1, currentStep: currentStep),
                Expanded(child: _buildStepLine(isActive: currentStep >= 2)),
                _buildStepCircle(step: 2, currentStep: currentStep),
              ],
            ),
          ),
          SizedBox(height: 15),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              _buildStepTitle(step: 0, currentStep: currentStep, title: 'عنوان الشحن'),
              Expanded(child: Container()),
              _buildStepTitle(step: 1, currentStep: currentStep, title: 'طريقة الشحن'),
              Expanded(child: Container()),
              _buildStepTitle(step: 2, currentStep: currentStep, title: 'طريقة الدفع'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepCircle({required int step, required int currentStep}) {
    Color activeColor = appcolors.buttoncoloronboarding;
    const Color inactiveColor = Colors.grey;

    final bool isCompleted = currentStep > step;
    final bool isCurrent = currentStep == step;

    return Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isCompleted || isCurrent ? activeColor : inactiveColor,
          width: 2.w,
        ),
        color: isCompleted ? activeColor : Colors.white,
      ),
      child: Center(
        child: isCompleted
            ? Icon(Icons.check, color: Colors.white, size: 18.sp)
            : isCurrent
                ? Container(
                    width: 12.w,
                    height: 12.w,
                    decoration: BoxDecoration(
                      color: activeColor,
                      shape: BoxShape.circle,
                    ),
                  )
                : null,
      ),
    );
  }

  Widget _buildStepTitle({
    required int step,
    required int currentStep,
    required String title,
  }) {
    Color activeColor = appcolors.buttoncoloronboarding;
    const Color inactiveColor = Colors.grey;

    final bool isCompleted = currentStep > step;
    final bool isCurrent = currentStep == step;

    return Text(
      title,
      style: TextStyle(
        color: isCompleted || isCurrent ? activeColor : inactiveColor,
        fontFamily: Appstring.fontfamily,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildStepLine({required bool isActive}) {
    return Container(
      height: 3.h,
      color: isActive ? appcolors.buttoncoloronboarding : Colors.grey[300],
    );
  }

  Widget _buildCurrentStep(BuildContext context, CheckoutState state) {
    if (state is CheckoutAddressStep) {
      // Pass the GlobalKey to AddressStepScreen
      return AddressStepScreen(key: _addressKey);
    } else if (state is CheckoutShippingStep) {
      return ShippingStepScreen();
    } else if (state is CheckoutPaymentStep) {
      return PaymentStepScreen();
    }
    return AddressStepScreen(key: _addressKey);
  }

  void _handleNextStep(BuildContext context, CheckoutState state) {
    final cubit = context.read<CheckoutCubit>();

    if (state is CheckoutAddressStep) {
      
      if (state.address != null) {
        cubit.proceedToShipping(state.address!);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('يرجى إكمال بيانات العنوان')),
        );
      }
    } else if (state is CheckoutShippingStep) {
      if (state.shippingMethod != null) {
        cubit.proceedToPayment();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('يرجى اختيار طريقة الشحن')),
        );
      }
    } else if (state is CheckoutPaymentStep) {
      if (state.paymentMethod != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('جاري معالجة الدفع...')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('يرجى اختيار طريقة الدفع')),
        );
      }
    }
  }
}