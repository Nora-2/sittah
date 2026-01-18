import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glasses/features/account/data/models/userprofile.dart';

part 'account_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> fetchProfileData() async {
    emit(ProfileLoading()); // show spinner immediately
    print('🟡 fetchProfileData START');

    try {
      // simulate API delay
      await Future.delayed(const Duration(milliseconds: 500));

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

      emit(ProfileLoaded(user)); // send user data to UI
    } catch (e) {
      emit(ProfileError("فشل تحميل البيانات"));
    }
  }
}
