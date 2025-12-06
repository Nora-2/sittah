import 'package:glasses/features/home/data/models/product_model.dart';

import '../../data/models/coupon_model.dart';

abstract class StoreState {}

class StoreInitial extends StoreState {}

class StoreLoading extends StoreState {}

class StoreLoaded extends StoreState {
  final List<ProductModel> products;
  final List<CouponModel> validCoupons;
  final List<CouponModel> invalidCoupons;

  StoreLoaded({
    required this.products,
    required this.validCoupons,
    required this.invalidCoupons,
  });
}

class StoreError extends StoreState {
  final String message;
  StoreError(this.message);
}