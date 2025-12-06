import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/home/data/models/product_model.dart';
class ProductCard extends StatelessWidget {
  final ProductModel product; // Receive data

  const ProductCard({
    super.key, 
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.productdetailesscreen, arguments: product);
      },
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: appcolors.whicolor,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // Align for RTL
          children: [
            // 1. Pass data to your Custom Image Container
            Imagecontainer(product: product),

            SizedBox(height: 8.h),

            // 2. Medical Tag (Yellow) - Outside the image box
            Align(
              alignment: Alignment.centerRight, // Align start RTL
              child: Container(
                decoration: BoxDecoration(
                  color: appcolors.producthiligt,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                child: Text(
                  Appstring.category1, // "Medical"
                  style: TextStyle(
                    color: appcolors.producttext,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: Appstring.fontfamily,
                  ),
                ),
              ),
            ),

            SizedBox(height: 4.h),

            // 3. Title & Description
            Text(
              product.title, // Dynamic Title
          
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                fontFamily: Appstring.fontfamily,
              ),
            ),
            Text(
              product.description, // Dynamic Desc
           
             textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 10.sp,
                color: appcolors.graylinethrough,
                fontFamily: Appstring.fontfamily,
              ),
            ),

            Spacer(),

            // 4. Footer: Prices & Cart
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      textDirection: TextDirection.rtl,
                      '${product.price.toInt()} د.ع', // Dynamic Price
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appcolors.buttoncoloronboarding,
                        fontFamily: Appstring.fontfamily,
                        fontSize: 14.sp,
                      ),
                    ),

                    Text(
                       textDirection: TextDirection.rtl,
                      '500 د.ع', // Static old price (or calculate from model)
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: Appstring.fontfamily,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 10.sp,
                        color: appcolors.graylinethrough,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: appcolors.buttoncoloronboarding,
                  radius: 16.r,
                  child: SvgPicture.asset(
                    AppIcons.cart,
                    width: 14.w,
                    height: 14.h,
                    color: appcolors.primarycolor
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class Imagecontainer extends StatelessWidget {
  final ProductModel product;

  const Imagecontainer({
    super.key, 
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h, // Fixed height to ensure Grid alignment
      width: double.infinity,
      decoration: BoxDecoration(
        color: appcolors.carshilight, // The light grey background
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Stack(
        children: [
          // 1. The Image (Centered)
          Center(
            child: Image.asset(
              // In real API, use Image.network(product.imageUrl)
              Appimage.cardglass, 
              width: 100.w,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            top: 0,
            right: 0, // Using RTL logic, right is the start
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: appcolors.card, // Your tag background color
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14.r),
                  bottomLeft: Radius.circular(12.r),
                ),
              ),
              child: Text(
                Appstring.newone,
                style: TextStyle(
                  fontSize: 10.sp, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Ensure text is visible
                ),
              ),
            ),
          ),

          // 3. Heart Icon (Top Right in RTL)
          Positioned(
            top: 6.h,
            left: 6.w, // Using RTL logic, left is the end
            child:product.isFavorite ?SvgPicture.asset(AppIcons.heartfill,width: 18,height: 18,): Icon(
              MyFlutterApp.heart,
          
              color: appcolors.black,
              size: 20.sp,
            )
          ),

          // 4. Rating (Bottom Left in RTL)
          Positioned(
            bottom: 6.h,
            left: 8.w,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  '${product.rating}', // Dynamic Rating
                  style: TextStyle(
                    fontWeight: FontWeight.w600, 
                    fontSize: 11.sp,
                                        fontFamily: Appstring.fontfamily
                  ),
                ),
                SizedBox(width: 2.w),
                Icon(
                  Icons.star, 
                  color: Colors.black, // Stars are usually gold/amber
                  size: 13.sp
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}