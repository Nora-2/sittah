// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/product/presentation/widgets/bottom_add_to_cart_bar.dart';
import 'package:glasses/features/product/presentation/widgets/color_selection_section.dart';
import 'package:glasses/features/product/presentation/widgets/included_section.dart';
import 'package:glasses/features/product/presentation/widgets/lens_details_content.dart';
import 'package:glasses/features/product/presentation/widgets/medical_lenses_section.dart';
import 'package:glasses/features/product/presentation/widgets/product_details_content.dart';
import 'package:glasses/features/product/presentation/widgets/product_image_slider.dart';
import 'package:glasses/features/product/presentation/widgets/product_info_section.dart';
import 'package:glasses/features/product/presentation/widgets/product_tabs.dart';
import 'package:glasses/features/product/presentation/widgets/shipping_returns_content.dart';
import 'package:glasses/features/product/presentation/widgets/size_guide_section.dart';
import 'package:glasses/features/product/presentation/widgets/you_might_like_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String _selectedColor = Appstring.black; // Manage selected color state here
  String _selectedTab = Appstring.productDetails; // Initial tab

  final List<String> _productImages = [
    Appimage.mainProduct,
    Appimage.mainProduct,
    Appimage.mainProduct,
    Appimage.mainProduct,
    Appimage.mainProduct,
    Appimage.mainProduct,
    Appimage.mainProduct,
    Appimage.mainProduct,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.whicolor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl, // For Arabic UI
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImageSlider(imageUrls: _productImages),
                      const ProductInfoSection(),
                      ColorSelectionSection(
                        onColorSelected: (color) {
                          setState(() {
                            _selectedColor = color;
                          });
                        },
                      ),
                      const SizeGuideSection(),
                      const MedicalLensesSection(),
                      const IncludedSection(),
                      ProductTabs(
                        selectedTab: _selectedTab,
                        onTabSelected: (tab) {
                          setState(() {
                            _selectedTab = tab;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.w), // Responsive padding
                        child: _buildTabContent(),
                      ),
                      const YouMightLikeSection(),
                      SizedBox(height: 20.h,)
                    ],
                  ),
                ),
              ),
              BottomAddToCartBar(currentTab: _selectedTab),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case Appstring.productDetails:
        return const ProductDetailsContent();
      case Appstring.lensDetails:
        return const LensDetailsContent();
      case Appstring.shippingAndReturns:
        return const ShippingReturnsContent();
      default:
        return const ProductDetailsContent();
    }
  }
}
