// widgets/product_card.dart
import 'package:flutter/material.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/screenutils.dart';
import 'package:glasses/core/utils/textstyle/textstyle.dart';

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
      padding: EdgeInsets.all(ScreenUtils.padding),
      decoration: BoxDecoration(
        color: appcolors.cardBackground,
        borderRadius: BorderRadius.circular(ScreenUtils.setWidth(12)),
        border: Border.all(color: appcolors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Image
          SizedBox(
            height: ScreenUtils.setHeight(120),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: ScreenUtils.setHeight(12)),
          // Title
          Text(
            title,
            style: AppTextStyles.subheading,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenUtils.setHeight(4)),
          // Subtitle
          Text(
            subtitle,
            style: AppTextStyles.caption,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenUtils.setHeight(12)),
          // Prices
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ج.م ${originalPrice.toStringAsFixed(2)}',
                style: AppTextStyles.caption.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: ScreenUtils.setWidth(8)),
              Text(
                'ج.م ${discountedPrice.toStringAsFixed(2)}',
                style: AppTextStyles.price.copyWith(
                  color: appcolors.success,
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenUtils.setHeight(4)),
          Text(
            'ج.م ${finalPrice.toStringAsFixed(2)}',
            style: AppTextStyles.caption,
          ),
          SizedBox(height: ScreenUtils.setHeight(12)),
          // Add to Cart Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: appcolors.primary,
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtils.setHeight(12),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ScreenUtils.setWidth(8)),
                ),
              ),
              child: Text(
                'عربة التسوق',
                style: AppTextStyles.button,
              ),
            ),
          ),
        ],
      ),
    );
  }
}