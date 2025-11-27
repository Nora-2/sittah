import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glasses/features/account/data/models/userprofile.dart';

part 'account_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  // Simulate API Call
  Future<void> fetchProfileData() async {
    emit(ProfileLoading());
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      // Mock Data
      final user = UserProfile(
        name: "عبدالله ذكرالله",
        initials: "ع.ذ",
        email: "abdallahzikrallah@gmail.com",
        phone: "01127754437",
        growthPoints: 5,
        points: 2,
        vouchers: 4,
        favorites: 3,
        cartItems: 2,
      );

      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError("فشل تحميل البيانات"));
    }
  }
}

