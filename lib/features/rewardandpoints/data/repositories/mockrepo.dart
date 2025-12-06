import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/features/home/data/models/product_model.dart';

import '../models/coupon_model.dart';


class MockRepository {
  // Simulate API Network Delay
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(6, (index) => ProductModel(
      id: index,
      title: "نظارات ويستلي", // Westley Glasses
      description: "نظارات كريستال مربعة من \nخشب الأبنوس",
      price: 500.0,
      rating: 4.8,
      imageUrl: Appimage.cardglass, // Ensure you have a placeholder or use an Icon
      isFavorite: true,
    ));
  }

  Future<List<CouponModel>> getCoupons() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      // Valid Coupons
      ...List.generate(4, (index) => CouponModel(
        id: index,
        title: "الطلبات التي تزيد عن 179 \nد.ع",
        description: "2 أكتوبر 2025 - 17 أكتوبر 2025",
        discountAmount: "20 د.ع",
        expiryDate: "2025-10-17",
        isValid: true,
      )),
      // Invalid Coupons
      ...List.generate(3, (index) => CouponModel(
        id: index + 10,
        title: "الطلبات التي تزيد عن 179 \nد.ع",
        description: "2 أكتوبر 2025 - 17 أكتوبر 2025",
        discountAmount: "20 د.ع",
        expiryDate: "2024-01-01",
        isValid: false,
      )),
    ];
  }
}