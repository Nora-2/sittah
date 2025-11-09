import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:glasses/features/authantication/data/models/countryflag_model.dart';

part 'authantication_state.dart';

class AuthanticationCubit extends Cubit<AuthanticationState> {
  AuthanticationCubit() : super(AuthanticationInitial());

  bool isLogin = true;

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final dateController = TextEditingController();
  final newpasswordController = TextEditingController();
  final otpController = TextEditingController(); // ✅ Add OTP controller
  final formKey = GlobalKey<FormState>();

  // ✅ OTP Timer management
  double secondsRemaining = 55.0;
  Timer? otpTimer;

  /// ✅ Country code prefix for phone number
  CountryCode selectedCountry = countries[0];

  /// ✅ Get complete phone number with country code
  String get completePhoneNumber => '${selectedCountry.dialCode}${phoneController.text}';

  /// ✅ Update country code
  void updateCountry(CountryCode country) {
    selectedCountry = country;
    emit(CountryCodeChanged(country.dialCode));
  }

  /// ✅ Start OTP timer
  void startOtpTimer() {
    otpTimer?.cancel();
    secondsRemaining = 55.0;
    emit(OtpTimerUpdated(secondsRemaining));
    
    otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        emit(OtpTimerUpdated(secondsRemaining));
      } else {
        timer.cancel();
      }
    });
  }

  /// ✅ Resend OTP
  void resendOtp() {
    if (secondsRemaining == 0) {
      emit(AuthLoading());
      // Call your resend OTP API here
      Future.delayed(const Duration(seconds: 1), () {
        startOtpTimer();
        otpController.clear();
        emit(const AuthSuccess('تم إعادة إرسال الكود بنجاح'));
      });
    }
  }

  /// ✅ Verify OTP
  void verifyOtp(String otp) {
    if (otp.length == 6) {
      emit(AuthLoading());
      // Call your verify OTP API here
      Future.delayed(const Duration(seconds: 1), () {
        // If verification successful:
        emit(const AuthSuccess('تم التحقق من الكود بنجاح ✅'));
        // Navigate to next screen
      });
    } else {
      emit(const AuthError('الرجاء إدخال الكود كاملاً'));
    }
  }

  /// ✅ Toggle between Login and Signup modes
  void toggleMode() {
    isLogin = !isLogin;
    emit(AuthModeChanged(isLogin));
  }

  /// ✅ Validate and simulate authentication
  void submitForm() {
    if (formKey.currentState!.validate()) {
      emit(AuthLoading());
      Future.delayed(const Duration(seconds: 1), () {
        emit(AuthSuccess(
          isLogin ? 'تم تسجيل الدخول بنجاح ✅' : 'تم إنشاء الحساب بنجاح ✅',
        ));
      });
    } else {
      emit(const AuthError('يرجى ملء جميع الحقول بشكل صحيح'));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    dateController.dispose();
    newpasswordController.dispose();
    otpController.dispose();
    otpTimer?.cancel();
    return super.close();
  }
}