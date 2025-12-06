import 'package:equatable/equatable.dart';
import 'package:glasses/features/rewardandpoints/data/models/productreward.dart';

abstract class RewardState extends Equatable {
  @override
  List<Object> get props => [];
}

class RewardInitial extends RewardState {}

class RewardLoading extends RewardState {}

class RewardLoaded extends RewardState {
  final int points;
  final List<Product> products;
  final List<bool> dailyCheckIn;
  final bool showSuccessPopup;

  RewardLoaded({
    required this.points,
    required this.products,
    required this.dailyCheckIn,
    this.showSuccessPopup = false,
  });

  RewardLoaded copyWith({
    int? points,
    List<Product>? products,
    List<bool>? dailyCheckIn,
    bool? showSuccessPopup,
  }) {
    return RewardLoaded(
      points: points ?? this.points,
      products: products ?? this.products,
      dailyCheckIn: dailyCheckIn ?? this.dailyCheckIn,
      showSuccessPopup: showSuccessPopup ?? this.showSuccessPopup,
    );
  }

  @override
  List<Object> get props => [points, products, dailyCheckIn, showSuccessPopup];
}