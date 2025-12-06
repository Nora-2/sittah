// widgets/product_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double originalPrice;
  final double discountedPrice;
  final double finalPrice;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.originalPrice,
    required this.discountedPrice,
    required this.finalPrice,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appcolors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: appcolors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Image
          SizedBox(
            height: 120.h,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 12.h),
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          // Subtitle
          Text(
            subtitle
            ,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          // Prices
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ج.م ${originalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width:8.w),
              Text(
                'ج.م ${discountedPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  color: appcolors.success,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            'ج.م ${finalPrice.toStringAsFixed(2)}',
            
          ),
          SizedBox(height: 12.h),
          // Add to Cart Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: appcolors.primary,
                padding: EdgeInsets.symmetric(
                  vertical: 12.h),
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.w,)
                ),
              ),
              child: Text(
                'عربة التسوق',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}