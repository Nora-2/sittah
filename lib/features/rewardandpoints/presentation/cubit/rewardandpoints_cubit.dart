

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glasses/features/rewardandpoints/data/models/productreward.dart';
import 'package:glasses/features/rewardandpoints/presentation/cubit/rewardandpoints_state.dart';

class RewardCubit extends Cubit<RewardState> {
  RewardCubit() : super(RewardInitial());

  void fetchRewardsData() async {
    emit(RewardLoading());

    // Simulate API Network Delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock Data
    final products = List.generate(
      4,
      (index) => Product(
        name: index % 2 == 0 ? "فيوجن" : "ايليجانس",
        pointsCost: 8,
        image: "assets/glasses.png",
      ),
    );

    // Mock History
    final history = [true, true, true, false, false, false, false];

    // Emit Loaded state AND set showSuccessPopup to TRUE immediately
    emit(
      RewardLoaded(
        points: 3,
        products: products,
        dailyCheckIn: history,
        showSuccessPopup: true, // <--- This triggers the popup on open
      ),
    );
  }

  void dismissPopup() {
    if (state is RewardLoaded) {
      // Close the popup logic in state so it doesn't show again on rebuilds
      emit((state as RewardLoaded).copyWith(showSuccessPopup: false));
    }
  }
}
